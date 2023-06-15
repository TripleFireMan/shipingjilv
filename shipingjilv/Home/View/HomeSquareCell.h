//
//  HomeSquareCell.h
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSquareCell : UICollectionViewCell

@property (nonatomic, copy  ) void(^Tapges)(NSInteger);
@property (weak, nonatomic) IBOutlet UIView *qc;
@property (weak, nonatomic) IBOutlet UIView *aq;
@property (weak, nonatomic) IBOutlet UIView *xj;
@property (weak, nonatomic) IBOutlet UIView *ox;


@end

NS_ASSUME_NONNULL_END
