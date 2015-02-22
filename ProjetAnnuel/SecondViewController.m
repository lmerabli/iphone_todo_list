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



-(NSString *)addTextField{
    // This allocates a label
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //This sets the label text
    prefixLabel.text =@"## ";
    // This sets the font for the label
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    // This fits the frame to size of the text
    [prefixLabel sizeToFit];
    
    // This allocates the textfield and sets its frame
    UITextField *textField = [[UITextField  alloc] initWithFrame:
                              CGRectMake(20, 50, 280, 30)];
    
    // This sets the border style of the text field
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    [textField setFont:[UIFont boldSystemFontOfSize:12]];
    
    //Placeholder text is displayed when no text is typed
    textField.placeholder = @"Simple Text field";
    
    //Prefix label is set as left view and the text starts after that
    textField.leftView = prefixLabel;
    
    //It set when the left prefixLabel to be displayed
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    return textField;
    
    // Adds the textField to the view.
    //[self.view addSubview:textField];
    
    // sets the delegate to the current class
    //textField.delegate = self;
}

// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
    
        NSString *input = [self addTextField];
    // Adds the textField to the view.
    [self.view addSubview:input];
    
    // sets the delegate to the current class
    //textField.delegate = self;
    
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
