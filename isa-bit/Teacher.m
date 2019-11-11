//
//  Teacher.m
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import "Teacher.h"

#define PERSON_EAT_MASK  (1<<0)
#define PERSON_RUN_MASK  (1<<1)
#define PERSON_JUMP_MASK (1<<2)

@interface Teacher ()
{
    //该共用体只占一个字节
    union {
        char bits ; //char 占一个字节
        //或者 等效
        //int  bits ; //int arm64中占4个字节
        struct {
            char eat  : 1 ;  //1位
            char run  : 1 ;  //1位
            char jump : 1 ;  //1位
        };
    }_teachererj;
    
//或者 如下 等效  共用体中的结构体只是为了可读性（可有可无）
//    union {
//        char bits ;
//    }_teachererj;
    
}

@end


@implementation Teacher

#pragma mark  -- setter --
-(void)setEat:(BOOL)eat
{
    if (eat) {
        _teachererj.bits |= PERSON_EAT_MASK;
    }else{
        _teachererj.bits &= ~PERSON_EAT_MASK;
    }
}

-(void)setRun:(BOOL)run
{
    if (run) {
        _teachererj.bits |= PERSON_RUN_MASK;
    }else{
        _teachererj.bits &= ~PERSON_RUN_MASK;
    }
    
}

-(void)setJump:(BOOL)jump
{
    if (jump) {
        _teachererj.bits |= PERSON_JUMP_MASK;
    }else{
        _teachererj.bits &= ~PERSON_JUMP_MASK;
    }
    
}

#pragma mark  -- getter --

-(BOOL)isEat
{
    return (_teachererj.bits& PERSON_EAT_MASK) > 0;
}

-(BOOL)isRun
{
    return (_teachererj.bits & PERSON_RUN_MASK) > 0;
}

-(BOOL)isJump
{
    return (_teachererj.bits & PERSON_JUMP_MASK) > 0;
}

@end
