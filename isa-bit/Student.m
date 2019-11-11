//
//  Student.m
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import "Student.h"

@interface Student ()
{
    struct {
        //从低地址到高地址排列
        char eat   : 1 ; //占一位
        char run   : 1 ; //占一位
        char jump  : 1 ; //占一位
    }_studenterj;
    //该结构体各成员共占3位，所以系统会分配一个字节给该结构体。

    //当占的位数为1位时，在getter方法中，返回的BOOL值占1个字节，即8位，而该值只占1位，系统会将1位强转成8位, 可能会出现潜在的bug，可以改成如下：
    //        char eat   : 2 ; //占两位
    //        char run   : 2 ; //占两位
    //        char jump  : 2 ; //占两位
    
}

@end

@implementation Student

#pragma mark  -- setter --

-(void)setEat:(BOOL)eat
{
    _studenterj.eat = eat ;
}

-(void)setRun:(BOOL)run
{
    _studenterj.run = run ;
}

-(void)setJump:(BOOL)jump
{
    _studenterj.jump = jump ;
}

#pragma mark  -- getter --

-(BOOL)isEat
{
    return _studenterj.eat ;
}

-(BOOL)isRun
{
    return _studenterj.run  ;
}

-(BOOL)isJump
{
    return _studenterj.jump ;
}

@end
