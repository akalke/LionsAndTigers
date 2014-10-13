//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Amaeya Kalke on 10/12/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "TopViewController.h"
#import "CustomCollectionViewCell.h"

@interface TopViewController ()
@property (strong, nonatomic) NSMutableArray *photosArray;
@property (strong, nonatomic) NSMutableArray *lionsArray;
@property (strong, nonatomic) NSMutableArray *tigersArray;
@property (strong, nonatomic) IBOutlet UICollectionView *imageCollectionView;



@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photosArray = [[NSMutableArray alloc] init];

    self.lionsArray = [[NSMutableArray alloc] init];
    [self.lionsArray addObject:[UIImage imageNamed:@"lion1"]];
    [self.lionsArray addObject:[UIImage imageNamed:@"lion2"]];
    [self.lionsArray addObject:[UIImage imageNamed:@"lion3"]];
    //NSLog(@"lion: %lu: ", (unsigned long)self.lionsArray.count);

    self.tigersArray = [[NSMutableArray alloc] init];
    [self.tigersArray addObject:[UIImage imageNamed:@"tiger1"]];
    [self.tigersArray addObject:[UIImage imageNamed:@"tiger2"]];
    [self.tigersArray addObject:[UIImage imageNamed:@"tiger3"]];
    //NSLog(@"tiger: %lu: ", (unsigned long)self.tigersArray.count);

    self.photosArray = self.lionsArray;

    // Do any additional setup after loading the view.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photosArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    cell.animalImages.image = [self.photosArray objectAtIndex:indexPath.row];
    return cell;

}

-(void)lionButtonPressed{
    self.photosArray = self.lionsArray;
    [self.imageCollectionView reloadData];
}

-(void)tigerButtonPressed{
    self.photosArray = self.tigersArray;
    [self.imageCollectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onItemButtonPressed:(id)sender {
    NSLog(@"Item button pressed");
    [self.delegate topRevealButtonTapped];
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
