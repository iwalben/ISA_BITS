//
//  BitCalculate.m
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import "BitCalculate.h"
typedef enum {
    RalOptionEatB = 1<<0,     //0b0001 = 1
    RalOptionEatC = 1<<1,     //0b0010 = 2
    RalOptionEatD = 1<<2,     //0b0100 = 4
    RalOptionEatE = 1<<3,     //0b1000 = 8
} RalOption;

//等效于
//typedef enum : NSUInteger {
//    BCalEatB = 1,
//    BCalEatC = 2,
//    BCalEatD = 4,
//    BCalEatE = 8,
//} BCalOption;

@interface BitCalculate ()

@end

@implementation BitCalculate

/**
   0b0000
 | 0b0001
 | 0b1000
 -------
   0b1001
 */
-(instancetype)init
{
    if (self = [super init]) {
        [self setOptions:RalOptionEatB | RalOptionEatC | RalOptionEatE];
    }
    return self ;
}


/**
  0b1001
 &0b0001
 -------
  0b0001
 */
-(void)setOptions:(RalOption)options
{
    
    if (options & RalOptionEatB) {
        NSLog(@"包含了B");
    }
    
    if (options & RalOptionEatC) {
        NSLog(@"包含了C");
    }
    
    if (options & RalOptionEatD) {
        NSLog(@"包含了D");
    }
    
    if (options & RalOptionEatE) {
        NSLog(@"包含了E");
    }
}

@end
