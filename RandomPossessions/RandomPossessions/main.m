//
//  main.m
//  RandomPossessions
//
//  Created by iMac on 14-4-17.
//  Copyright (c) 2014年 com.iosinit. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        [items insertObject:@"Zero" atIndex:0];
        for (int i=0; i< [items count]; i++) {
            NSLog(@"%@",[items objectAtIndex:i]);
        }
        items = nil;
    }
    return 0;
}

