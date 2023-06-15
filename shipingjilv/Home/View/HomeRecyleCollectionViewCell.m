//
//  HomeRecyleCollectionViewCell.m
//  VideoRecord
//
//  Created by chengyan on 2023/4/20.
//

#import "HomeRecyleCollectionViewCell.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "TYCyclePagerViewCell.h"
#import "Video.h"
@interface HomeRecyleCollectionViewCell ()<TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;


@property (weak, nonatomic) IBOutlet UISwitch *horCenterSwitch;
@end
@implementation HomeRecyleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addPagerView];
//    [self addPageControl];
    [self loadData];
    // Initialization code
}

- (id) init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];

    pagerView.layout.itemSize = CGSizeMake(100, 156);
//    pagerView.layer.borderWidth = 1;
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self addSubview:pagerView];

    _pagerView = pagerView;
}

//- (void)addPageControl {
//    TYPageControl *pageControl = [[TYPageControl alloc]init];
//    //pageControl.numberOfPages = _datas.count;
//    pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
//    pageControl.pageIndicatorSize = CGSizeMake(12, 6);
//    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    pageControl.pageIndicatorTintColor = [UIColor grayColor];
////    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
////    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
////    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
////    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
////    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
////    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
//    [_pagerView addSubview:pageControl];
//    _pageControl = pageControl;
//}

- (void)loadData {
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 7; ++i) {
        if (i == 0) {
            [datas addObject:[UIColor redColor]];
            continue;
        }
        [datas addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0]];
    }
    _datas = [datas copy];
    _pageControl.numberOfPages = _datas.count;
    [_pagerView reloadData];
    _pagerView.layout.layoutType = 1;
    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}
- (void) setDatas:(NSArray *)datas{
    _datas = datas;
    [_pagerView reloadData];
    _pagerView.layout.layoutType = 1;
}
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    Video *v = [self.datas objectAtIndex:index];
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
//    cell.backgroundColor = _datas[index];
//    cell.label.text = [NSString stringWithFormat:@"index->%ld",index];
    cell.label.image = [UIImage imageWithData:v.pic];
    return cell;
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index {
    Video *v = [self.datas objectAtIndex:index];
//    [@"VideoDetailVC" routePageByParameters:@{@"video":v}];
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(154, 250);
    layout.itemSpacing = 15;
    //layout.minimumAlpha = 0.3;
//    layout.itemHorizontalCenter = _horCenterSwitch.isOn;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

@end
