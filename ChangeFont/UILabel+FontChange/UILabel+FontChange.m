//
//  UILabel+FontChange.m
//  LiquoriceDoctorProject
//
//  Created by HenryCheng on 15/12/7.
//  Copyright © 2015年 iMac. All rights reserved.
//

#import "UILabel+FontChange.h"
#import <objc/runtime.h>

#define CustomFontName @"FZLBJW--GB1-0"

@implementation UILabel (FontChange)

+ (void)load {
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获得viewController的生命周期方法的selector
        SEL systemSel = @selector(willMoveToSuperview:);
        //自己实现的将要被交换的方法的selector
        SEL swizzSel = @selector(myWillMoveToSuperview:);
        //两个方法的Method
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        
        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        } else {
            //否则，交换两个方法的实现
            method_exchangeImplementations(systemMethod, swizzMethod);
        }
        
    });
}

- (void)myWillMoveToSuperview:(UIView *)newSuperview {
    
    [self myWillMoveToSuperview:newSuperview];
    if ([self isKindOfClass:NSClassFromString(@"UIButtonLabel")]) {
        return;
    }
    if (self) {
        
        if (self.tag == 10086) {
            self.font = [UIFont systemFontOfSize:self.font.pointSize];
        } else {
            if ([UIFont fontNamesForFamilyName:CustomFontName])
                self.font  = [UIFont fontWithName:CustomFontName size:self.font.pointSize];
        }
    }

}


@end
