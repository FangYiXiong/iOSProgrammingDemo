//
//  main.m
//  RandomPossessions
//
//  Created by iMac on 14-4-17.
//  Copyright (c) 2014年 com.iosinit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        for (int i=0; i<2; i++) {
            [items addObject:[BNRItem randomItem]];
        }
        BNRContainer *aContainer = [[BNRContainer alloc] initWithItemName:@"首饰盒" valueInDollars:5 serialNumber:@"9F3F4"];
        aContainer.subItems = [items copy];
//        NSLog(@"\nBNRContainer 的描述信息是 %@",aContainer);
        NSMutableArray *someItems = [[NSMutableArray alloc] init];
        for (int i=0; i<2; i++) {
            [someItems addObject:[BNRItem randomItem]];
        }
        [someItems addObject:aContainer];
        BNRContainer *anotherContainer = [[BNRContainer alloc] initWithItemName:@"保险箱" valueInDollars:10 serialNumber:@"9F3F4"];
        anotherContainer.subItems = [someItems copy];
        NSLog(@"\nanother BNRContainer 的描述信息是 %@",anotherContainer);
    }
    return 0;
}

