//
//  Event.h
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/4.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entity;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * abc;
@property (nonatomic, retain) Entity *eRelation;

@end
