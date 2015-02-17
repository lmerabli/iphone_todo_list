//
//  ViewController.m
//  ProjetAnnuel
//
//  Created by Gaël on 14/02/2015.
//  Copyright (c) 2015 gael. All rights reserved.
//

#import "ViewController.h"

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







- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //c'est pour un projet plus structuré ou l'on ecrase pas a chaque fois
    app = [[UIApplication sharedApplication] delegate];
    context = [app managedObjectContext];
    [self ajoutProjet:@"platre"];
    [self ajoutProjet:@"faire la plonge"];
    
    
  //  [self afficheContenu:@"Projets"];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
