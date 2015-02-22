//
//  ViewController.m
//  ProjetAnnuel
//
//  Created by Gaël on 14/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)ajoutProjet : (NSString *) libelle {
 
    NSManagedObject * newProjet;
 
    newProjet = [NSEntityDescription insertNewObjectForEntityForName: @"Projets" inManagedObjectContext:context];
    
    NSLog(@"id -> %ld", [self autoIncrementProject:@"Projets"]);
    
    NSNumber *idNumber = [NSNumber numberWithInt:[self autoIncrementProject:@"Projets"]];
    
    [newProjet setValue:libelle forKey:@"libelle_projet"];
    [newProjet setValue:idNumber forKey:@"id_projet"];
   
  
    [context save:nil];
}


-(NSInteger)autoIncrementProject : (NSString *) table{
 
    NSEntityDescription * query = [NSEntityDescription entityForName:table inManagedObjectContext:context];
    NSFetchRequest * request = [NSFetchRequest new];
    [request setEntity:query];
  
    NSError * error;
    NSArray * mesResultats = [context executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"%@", error.description);
    }
   
    NSInteger newID = 0;
    
    for (NSDictionary *dict in mesResultats) {
        NSInteger IDToCompare = [[dict valueForKey:@"id_projet"] integerValue];
        
        if (IDToCompare >= newID) {
            newID = IDToCompare + 1;
        }
    }
    
    NSLog(@"new id -> %ld",newID);
    return newID;
    
}

//retourne le comptenu table
-(NSArray *)findListeProject
{
    
    NSEntityDescription * query = [NSEntityDescription entityForName:@"Projets" inManagedObjectContext:context];
    NSFetchRequest * request = [NSFetchRequest new];
    [request setEntity:query];
    
    NSError * error;
    NSArray * mesResultats = [context executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"%@", error.description);
    }
    
       return mesResultats;
}





















//fonction lié a la liste
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"je suis dans la fonction");
    static NSString *cellid = @"uniqueIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    NSMutableDictionary *dict = [_tableData objectAtIndex:indexPath.row];
  
    cell.textLabel.text = [dict valueForKey:@"libelle_projet"];

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"fonction 3 void");
    NSMutableDictionary * dict = [_tableData objectAtIndex:indexPath.row];
    
    SecondViewController * vc = [[SecondViewController alloc] initWithDictionnaire:dict];
    vc.dictVoiture= dict;
    //[self presentViewController:vc animated:YES completion:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)vcAddProjet{
    NSLog(@"Button 2 pressed");
    SecondViewController * vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}















- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //c'est pour un projet plus structuré ou l'on ecrase pas a chaque fois
    app = [[UIApplication sharedApplication] delegate];
    context = [app managedObjectContext];
    [self ajoutProjet:@"platre"];
    [self ajoutProjet:@"faire la plonge"];
    
    
  //  [self afficheContenu:@"Projets"];
    
    //NSLog(@"new id -> %@",[self findListeProject]);
    _tableData = [self findListeProject];
    
    
    //button 2
    self.goTo2Btn = [[UIButton alloc] init];
    _goTo2Btn.frame = CGRectMake((self.view.frame.size.width-100)/2,(self.view.frame.size.height-100)/2,100,35);
    _goTo2Btn.backgroundColor = [UIColor greenColor];
    [_goTo2Btn addTarget:self action:@selector(vcAddProjet) forControlEvents:UIControlEventTouchDown];
    [_goTo2Btn setTitle:@"Add Projet" forState:UIControlStateNormal];
    [self.view addSubview:_goTo2Btn];
    
    
    
    //liste projet
    _maListe = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(self.topView.frame))];
    _maListe.delegate = self;
    _maListe.dataSource = self;
    [_maListe setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_maListe];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
