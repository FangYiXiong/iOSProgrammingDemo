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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"定时提醒";
        self.tabBarItem.image = [UIImage imageNamed:@"Time.png"];
    }
    return self;
}

- (IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"在 %@ 设置了一个提醒。",date);
    // 增加一个本地通知
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"催眠我！";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"%s got called.",__PRETTY_FUNCTION__);
}

@end
