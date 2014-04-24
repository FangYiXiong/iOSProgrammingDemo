//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by FangYiXiong on 14-4-17.
//  Copyright (c) 2014年 com.iosinit. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer
- (NSString *)description{
    NSMutableString *aString = [NSMutableString string];
    int totalValue = 0;
    for (BNRItem *item in self.subItems) {
        [aString appendString:[NSString stringWithFormat:@"\t%@ \n",item.description]];
        if ([item isKindOfClass:[BNRContainer class]]){
            BNRContainer * aContainer = (BNRContainer *)item;
            for (BNRItem *anItem in aContainer.subItems) {
                totalValue += anItem.valueInDollars;
            }
        }
        totalValue += item.valueInDollars;
    }
    totalValue += self.valueInDollars;
    NSString * result = [NSString stringWithFormat:@"%@: 价值 $%d, 包含以下物品：\n%@",self.itemName,totalValue,aString];
    return result;
}
@end
