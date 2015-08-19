//
//  Entity.h
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/4.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * lala;
@property (nonatomic, retain) Event *relationship;

@end
