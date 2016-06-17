//
//  main.m
//  3.OC (串讲)-ARC
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.ARC中不能使用retain,release,autorelease,retainCount
        //2.不能显示调用super dealloc
        //3.所有对象默认修饰都是 __strong
        NSArray *arr1=[[NSArray alloc] initWithObjects:@"hello",@"qingyun",@(2015), nil];
        NSLog(@"arr1=%@",arr1);
        
        //自定义类的对象的内存
        Person *p0;
        {
            Person *p=[Person new];
            p0=p;
            [p setName:@"小明"];
            NSLog(@"p=%@",p);
        }
        
        {
            Person *p2=[Person personWithName:@"小红" andAge:21];
             NSLog(@"p2=%@",p2);
        }
        
        Person *p3=[[Person alloc] initWithName:@"小米" andAge:22];
        NSLog(@"p3=%@",p3);
        
        //复合中的内存管理
        Car *c1=[Car new];
        [c1 setCarName:@"丰田"];
        [p0 setCar:c1];
        
        //NSTimer
        [c1 showCar];
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.5]];
        
        //继承中的内存管理
        Student *s1=[[Student alloc] initWithName:@"笑笑" andAge:11];
        NSLog(@"%@",s1);
        
        //循环引用@
        [c1 setPerson:p0];
    }
    return 0;
}
