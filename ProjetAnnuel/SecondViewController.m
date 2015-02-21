//
//  SecondViewController.m
//  ProjetAnnuel
//
//  Created by Gaël on 21/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController




-(id)initWithDictionnaire: (NSMutableDictionary *) dict
{
    NSLog(@"initWithDictionnaire je passe" );
    if(self=[super init])
    {
        
        self.dictVoiture = dict;
    }
    
    return self;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"Viewdidappear");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

-(void)loadView
{
    [super loadView];
    NSLog(@"loadView");
}












- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"dictionnaire voiture %@", self.dictVoiture );
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    _marqueLabel = [[UILabel alloc] init];
    _marqueLabel.frame = CGRectMake(50, 80, 250, 45);
    _marqueLabel.backgroundColor = [UIColor redColor];
    _marqueLabel.text = [self.dictVoiture valueForKey:@"libelle_projet"];
    [self.view addSubview:_marqueLabel];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
