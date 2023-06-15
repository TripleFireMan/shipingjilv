//
//  VideoDetailVC.h
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoDetailVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (id) initWithCoder:(NSCoder *)coder video:(Video *)video;
@end

NS_ASSUME_NONNULL_END
