//
//  ViewController.m
//  QuePasaCoTale
//
//  Created by Héctor Rodríguez Forniés on 6/2/15.
//  Copyright (c) 2015 HRF. All rights reserved.
//

#import "ViewController.h"
#import "UITapGestureRecognizerWithBlock.h"
#import "UISwipeGestureRecognizerWithBlock.h"
#import "Constants.h"
#import "ActionsLoader.h"
#import "Page.h"

@interface ViewController ()


//Collections
@property (nonatomic, strong) NSMutableArray *sceneViews;

@property (nonatomic, strong) NSMutableDictionary *sceneAnimations;

@property (nonatomic, strong) NSMutableDictionary *sceneLayers;

@property(nonatomic, strong) Page *thePage;

//Current page
@property (nonatomic) int currentPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //Init the collections or clear it if we are reloading a page
    [self reloadSceneCollections];
}


- (void) reloadSceneCollections {
    
    // Reset or instanciate the sceneViews
    if(!self.sceneViews) {
        self.sceneViews = [NSMutableArray array];
    }
    
    [self.sceneViews removeAllObjects];
    
    // Reset or instanciate the sceneAnimations
    if(!self.sceneAnimations) {
        self.sceneAnimations = [NSMutableDictionary dictionary];
    }
    
    [self.sceneAnimations removeAllObjects];
    
    
    // Reset or instanciate the sceneLayers
    if(!self.sceneLayers) {
        self.sceneLayers = [NSMutableDictionary dictionary];
    }
    
    [self.sceneLayers removeAllObjects];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"page1" ofType:@"json"];
    
    NSError* error;
    NSArray *arrayAnim = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:&error];
    
    self.thePage = [[Page alloc] initWithArray:arrayAnim AndNarrative: YES AndIdPage:@"" AndIdProject:@""];
    self.thePage.delegate = self;
    self.thePage.narrativeActive = YES;
    [self.thePage setOwnerView:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Delegate methods

- (void) performNextPageWithMetadataDict:(NSDictionary *)theMetaData {
    NSLog(@"Delegate Next");
//    NSArray *nextPages = [theMetaData objectForKey: kNextPages];
}

-(void) performPrevPageWithMetadataDict:(NSDictionary *)theMetaData {
    NSLog(@"Delegate Prev");
//    NSArray *prevPages = [theMetaData objectForKey: kPrevPages];
}

-(void) manageMainButton {
    NSLog(@"Delegate Main Menu");

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
