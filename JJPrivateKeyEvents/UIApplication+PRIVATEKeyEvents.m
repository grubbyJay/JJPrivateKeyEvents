//
//  UIApplication+PRIVATEKeyEvents.m
//  JJPrivateKeyEvents
//
//  Created by Jacob Jennings on 10/5/12.
//  Copyright (c) 2012 Jacob Jennings. All rights reserved.
//

#import "UIApplication+PRIVATEKeyEvents.h"
#import "GraphicsServices.h"
#import <objc/runtime.h>

NSString * const JJPrivateKeyEventFiredNotification = @"JJPrivateKeyEventFiredNotification";
NSString * const JJPrivateKeyEventUserInfoKeyUnicodeKeyCode = @"JJPrivateKeyEventUserInfoKeyUnicodeKeyCode";
NSString * const JJPrivateKeyEventUserInfoKeyGSEventFlags = @"JJPrivateKeyEventUserInfoKeyGSEventFlags";

@implementation UIApplication (PRIVATEKeyEvents)

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(_handleKeyEvent:)), class_getInstanceMethod(self, @selector(customHandleKeyEvent:)));
}

- (void)customHandleKeyEvent:(GSEventRef)gsEvent
{
    NSLog(@"%@, %d", gsEvent, GSEventGetKeyCode(gsEvent));

    NSNumber *unicodeKeyCodeNumber = [NSNumber numberWithInt:GSEventGetKeyCode(gsEvent)];
    NSNumber *gsEventFlagsNumber = [NSNumber numberWithInt:GSEventGetModifierFlags(gsEvent)];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JJPrivateKeyEventFiredNotification
                                                        object:self
                                                      userInfo:@{ JJPrivateKeyEventUserInfoKeyUnicodeKeyCode : unicodeKeyCodeNumber,  JJPrivateKeyEventUserInfoKeyGSEventFlags : gsEventFlagsNumber }];
    [self customHandleKeyEvent:gsEvent];
}

@end
