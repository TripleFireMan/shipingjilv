//
//  HomeVC.m
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import "HomeVC.h"
#import "HomeRecyleCollectionViewCell.h"
#import "Video.h"
#import "HomeSquareCell.h"
#import "HomeVideoCell.h"
#import "VideoDetailVC.h"
@interface HomeVC()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<Video*>* datas;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeRecyleCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomeRecyleCollectionViewCell"];
    [self loadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeRecyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeRecyleCollectionViewCell" forIndexPath:indexPath];
        NSArray *subs = [self.datas subarrayWithRange:NSMakeRange(0, 5)];
        cell.datas = subs;
        return cell;
    }else  if (indexPath.section == 1){
        HomeSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"square" forIndexPath:indexPath];
        cell.Tapges = ^(NSInteger idx) {
            NSLog(@"index === %@",@(idx));
        };
        return cell;
    }else {
        HomeVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeVideoCell" forIndexPath:indexPath];
        Video *video = [self.datas objectAtIndex:indexPath.row];
        cell.imgview.image = [UIImage imageWithData:video.pic];
        cell.video = video;
        cell.lbl.text = video.name;
        return cell;
    }

}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) return  1;
    if (section == 1) return  1;
    if (section == 2) return self.datas.count;
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth, 246);
    }else if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth, 128);
    }else {
        CGFloat width = (kScreenWidth - 30 - 21)/3.0;
        CGFloat height = width * (159/111.0) + 43;
        return CGSizeMake(width, height);
//        return CGSizeMake(100, 500);
    }
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, 0);
}




- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return UIEdgeInsetsMake(0, 15, 0, 15);
    }else {
        return UIEdgeInsetsZero;
    }
}

- (void)loadData {
    self.datas = @[].mutableCopy;
    [DB inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQueryWithFormat:@"SELECT * FROM main.records"];
        while ([set next]) {
            NSLog(@"----%@",[set resultDictionary]);
            NSInteger idx = [[set resultDictionary][@"id"] intValue];
            NSLog(@"idx===%ld",idx);
            [self.datas addObject:[Video modelWithJSON:[set resultDictionary]]];
            [self.collectionView reloadData];
        }
    }];
}
- (IBSegueAction VideoDetailVC *)showVideoDetail:(NSCoder *)coder sender:(id)sender {
    HomeVideoCell *cell = (HomeVideoCell *)sender;
    return [[VideoDetailVC alloc] initWithCoder:coder video:cell.video];
}


@end
