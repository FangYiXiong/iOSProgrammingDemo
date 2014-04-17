//
//  BNRItem.m
//  RandomPossessions
//
//  Created by FangYiXiong on 14-4-17.
//  Copyright (c) 2014年 com.iosinit. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (id)randomItem{
    NSArray *randomAdjectiveList = @[@"毛茸茸的",@"生锈的",@"闪闪发光的"];
    NSArray *randomNounList = @[@"玩具熊",@"叉勺",@"Mac电脑"];
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",randomAdjectiveList[adjectiveIndex],randomNounList[nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}

- (id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber{
    if (self = [super init]) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (id)initWithItemName:(NSString *)name{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (id)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (id)init{
    return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

- (void)setContainedItem:(BNRItem *)containedItem{
    _containedItem = containedItem;
    containedItem.container = self;
}

- (NSString *)description{
    NSString *result = [[NSString alloc] initWithFormat:@"%@ (%@): 价值 $%d, 记录于 %@",self.itemName,self.serialNumber,self.valueInDollars,self.dateCreated];
    return result;
}

@end
