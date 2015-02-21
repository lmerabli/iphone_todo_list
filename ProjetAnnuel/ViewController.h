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


@interface ViewController : MotherViewController<UITableViewDelegate,UITableViewDataSource>
{

    AppDelegate * app;
    NSManagedObjectContext * context;
}

    @property(nonatomic) UITableView * maListe;
    @property(nonatomic) NSArray * tableData;

@end

