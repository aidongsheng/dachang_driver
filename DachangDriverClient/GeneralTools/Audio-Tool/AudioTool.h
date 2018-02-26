//
//  AudioTool.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/3.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KeypadSoundType) {
    KeypadSoundTypeSuccessed,
    KeypadSoundTypeFailed,
    KeypadSoundTypeNormal,
    KeypadSoundTypeNavigation_push,
    KeypadSoundTypeNavigation_pop,
};

typedef NS_ENUM(NSUInteger, kSystemKeyPressedSound) {
    kSystemKeyPressedSoundTink = 1103,
    kSystemKeyPressedSoundTock1,
    kSystemKeyPressedSoundTock2,
};

@interface AudioTool : NSObject


/**
 AudioTool 单例类方法

 @return AudioTool 单例对象
 */
+ (AudioTool *)shareTool;
/**
 播放系统按键音

 @param keyPressSound 按键音类型
 */
+ (void)playKeypadToneType:(kSystemKeyPressedSound)soundType;


/**
 震动
 */
+ (void)playVibrate;

@end
