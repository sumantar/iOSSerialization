//
//  ViewController.m
//  iOSSerialization
//
//  Created by sumantar on 26/02/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "ViewController.h"
#import "ModelClass.h"

@interface ViewController ()
{
    NSMutableArray *array;
    ModelClass *modelObject;
    
}
- (IBAction)onSerialize:(id)sender;
- (IBAction)onDeSerialize:(id)sender;
- (IBAction)onSerializeObject:(id)sender;
- (IBAction)onDeSerializeObject:(id)sender;
- (NSString *)storagePath;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    array = [[NSMutableArray alloc] init];
    [array addObject:@"1"];
    [array addObject:@"2"];
    [array addObject:@"3"];
    [array addObject:@"4"];
    [array addObject:@"5"];
    
    modelObject = [[ModelClass alloc] init];
    modelObject.name = @"Smart";
    modelObject.address = @"iOS Developer, India";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSerialize:(id)sender {
    BOOL result = [NSKeyedArchiver archiveRootObject:array toFile:[self storagePath]];
    if(result)
        NSLog(@"Successfully Stored the object");
}

- (IBAction)onDeSerialize:(id)sender {
    [array removeAllObjects];
    NSLog(@"Array: %@", array);
    array = [NSKeyedUnarchiver unarchiveObjectWithFile:[self storagePath]];
    NSLog(@"Stored Array: %@", array);
}

- (IBAction)onSerializeObject:(id)sender {
    BOOL result = [NSKeyedArchiver archiveRootObject:modelObject toFile:[self storagePath]];
    if(result)
        NSLog(@"Successfully Stored the object");
}

- (IBAction)onDeSerializeObject:(id)sender {
    modelObject = nil;
    NSLog(@"Object: %@", modelObject);
    modelObject = [NSKeyedUnarchiver unarchiveObjectWithFile:[self storagePath]];
    NSLog(@"Object: Name: %@, Address: %@", modelObject.name, modelObject.address);
}

-(NSString *)storagePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = nil;
    
    if ([paths count] > 0)
        documentPath = [paths objectAtIndex:0];
    
    NSString *path = [documentPath stringByAppendingPathComponent:@"archievedData.dat"];
    
    return path;
}

@end
