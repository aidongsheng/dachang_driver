
//
//  BMKMapView+CLCategory.m
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BMKMapView+CLCategory.h"
#import <objc/runtime.h>


@interface BMKMapView()
@property (nonatomic,assign) CGPoint point;
@property (nonatomic,assign) BMKMapViewPointPosition pointPosition;
@end

@implementation BMKMapView (CLCategory)
static char * pointKey = "pointKey";
static char * pointPositionKey = "pointPositionKey";
static char * zoom_out_key = "zoom_out_key";
static char * zoom_in_key = "zoom_in_key";
static char * locate_btn_key = "locate_btn_key";



+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(init);
        SEL swizzledSelector = @selector(xxx_init);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (instancetype)xxx_init
{
    [self xxx_init];
    self.rotateEnabled = NO;
    self.buildingsEnabled = NO;
    self.overlookEnabled = NO;
    self.overlooking = 0;
    [self configureActions];
    return self;
}

- (void)showMapCenter
{
    [[BMKLocationTool shareInstance] stopUpdateLocation];
    [[BMKLocationTool shareInstance] startUpdateLocationBlock:^(BMKLocationManager * _Nonnull manager, BMKLocation * _Nullable location, NSError * _Nullable error) {
        NSString * address = [location.rgcData.province stringByAppendingString:location.rgcData.city==nil?@" ":location.rgcData.city];
        address = [address stringByAppendingString:location.rgcData.district==nil?@" ":location.rgcData.district];
        address = [address stringByAppendingString:location.rgcData.street==nil?@" ":location.rgcData.street];
        address = [address stringByAppendingString:location.rgcData.streetNumber==nil?@" ":location.rgcData.streetNumber];
        [self setCenterCoordinate:location.location.coordinate animated:YES];
    }];
}

- (CLLocationCoordinate2D)getCoordinate:(BMKMapViewPointPosition)pointPosition
{
    self.pointPosition = pointPosition;
    self.point = [self getPointAt:pointPosition];
    return [self convertPoint:self.point toCoordinateFromView:self];
}


- (CGPoint)getPointAt:(BMKMapViewPointPosition)position
{
    CGPoint pt;
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    if (position == BMKMapViewPointPositionTopLeft) {
        pt = CGPointMake(x,y);
    }else if (position == BMKMapViewPointPositionTopRight){
        pt = CGPointMake(x+width,y);
    }else if (position == BMKMapViewPointPositionBottomLeft){
        pt = CGPointMake(x,y+height);
    }else if (position == BMKMapViewPointPositionBottomRight){
        pt = CGPointMake(x+width,y+height);
    }else if (position == BMKMapViewPointPositionCenter){
        pt = CGPointMake(width/2, height/2);
    }else{
        pt = CGPointMake(0, 0);
    }
    return pt;
}
#pragma mark - point setter && getter
- (void)setPoint:(CGPoint)point
{
    objc_setAssociatedObject(self, &pointKey,[NSValue valueWithCGPoint:point],OBJC_ASSOCIATION_ASSIGN);
}
- (CGPoint)point
{
    return [objc_getAssociatedObject(self, &pointKey) CGPointValue];
}
#pragma mark - ============ PointPosition Setter && Getter ============
- (void)setPointPosition:(BMKMapViewPointPosition)pointPosition
{
    objc_setAssociatedObject(self, &pointPositionKey, @(pointPosition), OBJC_ASSOCIATION_ASSIGN);
}
- (BMKMapViewPointPosition)pointPosition
{
    return (BMKMapViewPointPosition)objc_getAssociatedObject(self, &pointPositionKey);
}

- (BMKMapRect)mapRectWithAnnotations:(NSArray *)annotations
{
    double maxLatitude = CGFLOAT_MIN,maxLongitude = CGFLOAT_MIN,minLatitude = CGFLOAT_MAX,minLongitude = CGFLOAT_MAX;
    for (int index = 0; index < annotations.count; index++) {
        id<BMKAnnotation> anno = annotations[index];
        CLLocationCoordinate2D coordinate = anno.coordinate;
        maxLatitude = maxLatitude < coordinate.latitude ? coordinate.latitude : maxLatitude;
        maxLongitude = maxLongitude < coordinate.longitude ? coordinate.longitude : maxLongitude;
        minLatitude = minLatitude > coordinate.latitude ? coordinate.latitude : minLatitude;
        minLongitude = minLongitude > coordinate.longitude ? coordinate.longitude : minLongitude;
    }
    CLLocationCoordinate2D maxCoordinate = CLLocationCoordinate2DMake(maxLatitude, maxLongitude);
    CLLocationCoordinate2D minCoordinate = CLLocationCoordinate2DMake(minLatitude, minLongitude);
    BMKMapRect rect;
    CGPoint rightTopPoint = [self convertCoordinate:maxCoordinate toPointToView:self];
    CGPoint bottomLeftPoint = [self convertCoordinate:minCoordinate toPointToView:self];
    rect.origin.x = rightTopPoint.x - self.frame.size.width;
    rect.origin.y = rightTopPoint.y;
    rect.size.width = rightTopPoint.x;
    rect.size.height = bottomLeftPoint.y;
    
    
    return rect;
}

#pragma mark - =========== 放大按钮 Setter && Getter ===========
- (QMUIButton *)zoom_in_btn
{
    return objc_getAssociatedObject(self, &zoom_in_key);
}
- (void)setZoom_in_btn:(QMUIButton *)zoom_in_btn
{
    objc_setAssociatedObject(self, &zoom_in_key, self.zoom_in_btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [zoom_in_btn setImage:image(@"default") forState:UIControlStateNormal];
    zoom_in_btn.frame = CGRectMake(0, 0, 100, 100);
    [self addSubview:zoom_in_btn];
}
#pragma mark - =========== 缩小按钮 Setter && Getter ===========
- (QMUIButton *)zoom_out_btn
{
    return objc_getAssociatedObject(self, &zoom_out_key);
}
- (void)setZoom_out_btn:(QMUIButton *)zoom_out_btn
{
    objc_setAssociatedObject(self, &zoom_out_key, self.zoom_out_btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark - =========== 定位按钮 Setter && Getter ===========
- (QMUIButton *)locateBtn
{
    return objc_getAssociatedObject(self, &locate_btn_key);
}
- (void)setLocateBtn:(QMUIButton *)locateBtn
{
    objc_setAssociatedObject(self, &locate_btn_key, self.locateBtn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
