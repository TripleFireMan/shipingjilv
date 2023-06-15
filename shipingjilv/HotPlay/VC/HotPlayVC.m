//
//  HotPlayVC.m
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import "HotPlayVC.h"
#import "HotPlayC_cell.h"
#import "VideoDetailVC.h"
@interface HotPlayVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) NSMutableArray <Video *>* datas;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HotPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HotPlayC_cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotPlayC_cell" forIndexPath:indexPath];
    Video *video = [self.datas objectAtIndex:indexPath.row];
    cell.imgview.image = [UIImage imageWithData:video.pic];
    cell.lbl.text = video.name;
    cell.video = video;
    return cell;

}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (kScreenWidth - 20 - 20)/2;
    CGFloat height = width * (111/167.0) + 43;
    return CGSizeMake(width, height);
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

    return UIEdgeInsetsMake(0, 10, 0, 10);
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

- (IBSegueAction VideoDetailVC *)showDetail:(NSCoder *)coder sender:(id)sender {
    HotPlayC_cell *cell = (HotPlayC_cell *)sender;
    return [[VideoDetailVC alloc] initWithCoder:coder video:cell.video];
}

@end
