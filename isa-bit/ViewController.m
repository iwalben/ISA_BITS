//
//  ViewController.m
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
#import "BitCalculate.h"

@interface ViewController ()

@end

//需求给Person类设置多个BOOL值属性 （eat,run,jump,） ，每个属性的内存大小只能占一位（1bit）

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //实质（按位与、按位或）
    Person * p = [Person new];
    p.eat = YES  ;
    p.run = NO ;
    p.jump = YES ;
    NSLog(@"eat = %d run = %d jump = %d",p.isEat,p.isRun,p.isJump);
    
    //采用位域的技术实现
    Student * s = [[Student alloc]init];
    s.eat = YES  ;
    s.run = YES ;
    s.jump = YES ;
    NSLog(@"s-eat = %d s-run = %d s-jump = %d",s.isEat,s.isRun,s.isJump);
    
    //采用共用体/联合体 和位域的技术实现
    Teacher * t = [[Teacher alloc]init];
    t.eat = NO  ;
    t.run = YES ;
    t.jump = NO ;
    NSLog(@"t-eat = %d t-run = %d t-jump = %d",t.isEat,t.isRun,t.isJump);
    
    BitCalculate * bce = [BitCalculate new];
}


@end
