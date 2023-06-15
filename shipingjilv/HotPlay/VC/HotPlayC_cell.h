//
//  HotPlayC_cell.h
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotPlayC_cell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (nonatomic, strong) Video *video;
@end

NS_ASSUME_NONNULL_END
