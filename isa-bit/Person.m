//
//  Person.m
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import "Person.h"

//需求给Person类设置多个BOOL值属性 （eat,run,jump,） ，每个属性的内存大小只能占一位（1bit）
//设计：0b00000001     eat为倒数1位，run为倒数第二位，jump为倒数第三位

//或者
//#define PERSON_EAT_MASK 0b00000001
//#define PERSON_RUN_MASK 0b00000010
//#define PERSON_JUMP_MASK 0b00000100

//或者
//#define PERSON_EAT_MASK 2
//#define PERSON_RUN_MASK 4
//#define PERSON_JUMP_MASK 8

//可阅读性最强
#define PERSON_EAT_MASK  (1<<0)
#define PERSON_RUN_MASK  (1<<1)
#define PERSON_JUMP_MASK (1<<2)

@interface Person ()
{
    //char 只占一个字节
    char _personeatrunjump;
}

@end

@implementation Person

-(instancetype)init
{
    if (self = [super init]) {
        _personeatrunjump = 0b00000001 ;
    }
    return self ;
}

#pragma mark  -- setter --
//  0b00010101
// |0b00000001
// &0b11111110
//------------
//

/**
 例如：
 要存入1到 目标值0010 0001的第三位中，
    0010 0001
 |  0000 0100  （掩码）
 ------------
    0010 0101
 
 要存入0到 目标值0010 0101的第三位中，
   0010 0101
 & 1111 1011  （掩码为0000 0100 ，对掩码取反操作 ～0000 0100 =   1111  1011 在进行按位&运算）
 ------------
   0010 0001
 
 */
-(void)setEat:(BOOL)eat
{
    if (eat) {
       _personeatrunjump |= PERSON_EAT_MASK;
    }else{
        _personeatrunjump &= ~PERSON_EAT_MASK;
    }
}

-(void)setRun:(BOOL)run
{
    if (run) {
        _personeatrunjump |= PERSON_RUN_MASK;
    }else{
        _personeatrunjump &= ~PERSON_RUN_MASK;
    }
    
}

-(void)setJump:(BOOL)jump
{
    if (jump) {
        _personeatrunjump = _personeatrunjump | PERSON_JUMP_MASK;
    }else{
        _personeatrunjump &= ~PERSON_JUMP_MASK;
    }
    
}

#pragma mark  -- getter --

-(BOOL)isEat
{
    return (_personeatrunjump & PERSON_EAT_MASK) > 0;
    //或者如下取2次反，转成bool值，效果一样
    //return !!(_personeatrunjump & PERSON_EAT_MASK) ;
}

-(BOOL)isRun
{
    return (_personeatrunjump & PERSON_RUN_MASK) > 0;
}

-(BOOL)isJump
{
    return (_personeatrunjump & PERSON_JUMP_MASK) > 0;
}

@end
