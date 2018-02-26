//
//  AudioTool.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/3.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "AudioTool.h"

@interface AudioTool()

@property (nonatomic,assign) uint32_t soundID;


@end

@implementation AudioTool

+ (AudioTool *)shareTool
{
    static AudioTool * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AudioTool alloc]init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _soundID = 1000;
    }
    return self;
}

+ (void)playKeypadToneType:(kSystemKeyPressedSound)soundType
{
    AudioServicesPlaySystemSound(soundType);
}

+ (void)playVibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
