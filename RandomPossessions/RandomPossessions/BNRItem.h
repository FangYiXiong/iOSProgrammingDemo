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
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

+ (id)randomItem;
- (id)initWithItemName:(NSString *)name;
- (id)initWithItemName:(NSString *)name
          serialNumber:(NSString *)sNumber;
- (id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber;

@end
