//
//  Person.h
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//需求给Person类设置多个BOOL值属性 （eat,run,jump,） ，每个属性的内存大小只能占一位（1bit）
//默认值eat为YES,run为NO,jump为NO。

@interface Person : NSObject

-(void)setEat:(BOOL)eat;
-(void)setRun:(BOOL)run;
-(void)setJump:(BOOL)jump;

-(BOOL)isEat;
-(BOOL)isRun;
-(BOOL)isJump;

@end

NS_ASSUME_NONNULL_END
