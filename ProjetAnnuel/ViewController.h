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

@interface ViewController : MotherViewController{

    AppDelegate * app;
    NSManagedObjectContext * context;

}
    
@end

