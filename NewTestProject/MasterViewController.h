//
//  MasterViewController.h
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/4.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MBProgressHUD.h>

#import <SVPullToRefresh.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate,MBProgressHUDDelegate>

@property (strong, nonatomic) DetailViewController               *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController         *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext             *managedObjectContext;





- (void)hudWasHidden:(MBProgressHUD *)hud;

-(void) myProgressTask :(MBProgressHUD *)hud;

@end

