//
//  BNRItem.h
//  RandomPossessions
//
//  Created by FangYiXiong on 14-4-17.
//  Copyright (c) 2014年 com.iosinit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, assign) int valueInDollars;
@property (nonatomic, strong) NSDate *dateCreated;


+(id)randomItem;
-(id)initWithItemName:(NSString *)name;
-(id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber;

@end
