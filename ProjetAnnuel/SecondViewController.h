//
//  SecondViewController.h
//  ProjetAnnuel
//
//  Created by Gaël on 21/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import "MotherViewController.h"

@interface SecondViewController : MotherViewController


@property(nonatomic)UILabel *marqueLabel;
@property(nonatomic) UIImageView *imgv;
@property(nonatomic) NSMutableDictionary *dictVoiture;


-(id)initWithDictionnaire: (NSMutableDictionary *) dict;


@end
