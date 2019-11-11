//
//  Teacher.h
//  isa-bit
//
//  Created by walben on 2019/9/19.
//  Copyright © 2019 WC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSObject


-(void)setEat:(BOOL)eat;
-(void)setRun:(BOOL)run;
-(void)setJump:(BOOL)jump;

-(BOOL)isEat;
-(BOOL)isRun;
-(BOOL)isJump;


@end

NS_ASSUME_NONNULL_END
