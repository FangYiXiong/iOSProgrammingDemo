//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Yixiong on 14-4-24.
//  Copyright (c) 2014年 Fang Yixiong. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController


- (IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"在 %@ 设置了一个提醒。",date);
}

@end
