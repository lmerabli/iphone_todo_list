//
//  ViewController.h
//  ProjetAnnuel
//
//  Created by Gaël on 14/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotherViewController.h"
#import "AppDelegate.h"
//#import "SecondViewController.h"


@interface ViewController : MotherViewController<UITableViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

{

    AppDelegate * app;
    NSManagedObjectContext * context;
}

    @property(nonatomic) UITableView * maListe;
    @property(nonatomic) NSArray * tableData;
  //  @property(nonatomic,retain) NSMutableArray *mesDonnees;



@end

