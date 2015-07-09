//
//  SharedHelper.m
//  FlipView
//
//  Created by VhaL on 7/5/15.
//
//

#import "SharedHelper.h"

@implementation SharedHelper



+(UIInterfaceOrientation)GetScreenOrientation{
    return [[UIApplication sharedApplication] statusBarOrientation];
}

#pragma mark - Singleton
+(instancetype)sharedInstance{
    static SharedHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SharedHelper new];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

@end
