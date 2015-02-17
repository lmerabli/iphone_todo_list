//
//  MotherViewController.m
//  ProjetAnnuel
//
//  Created by Gaël on 14/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import "MotherViewController.h"

@interface MotherViewController ()

@end

@implementation MotherViewController



-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [_topView setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:_topView];
    
    
    
    //button back
    self.backBtn = [[UIButton alloc] init];
    _backBtn.frame = CGRectMake(0,8,100,35);
    _backBtn.backgroundColor = [UIColor clearColor];
    [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [_backBtn setTitle:@"Retour" forState:UIControlStateNormal];
    [self.view addSubview:_backBtn];
    
    
    
    
    
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
