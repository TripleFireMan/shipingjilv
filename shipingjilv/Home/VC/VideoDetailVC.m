//
//  VideoDetailVC.m
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import "VideoDetailVC.h"

@interface VideoDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *directorLbl;
@property (weak, nonatomic) IBOutlet UILabel *actorLbl;
@property (weak, nonatomic) IBOutlet UILabel *yearLbl;
@property (weak, nonatomic) IBOutlet UILabel *typelbl;
@property (weak, nonatomic) IBOutlet UILabel *deslbl;


@property (nonatomic, strong) Video *video;
- (IBAction)back:(id)sender;

@end

@implementation VideoDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLbl.text = self.video.name;
    self.img.image = [UIImage imageWithData:self.video.pic];
    self.directorLbl.text = [NSString stringWithFormat:@"时长：%@",self.video.duration];
    self.actorLbl.text = [NSString stringWithFormat:@"演员：%@",self.video.actor];
    self.yearLbl.text = [NSString stringWithFormat:@"年份：%@",self.video.year];
    self.typelbl.text=  [NSString stringWithFormat:@"题材：%@",self.video.category];
    self.deslbl.text = self.video.introduce;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id)initWithCoder:(NSCoder *)coder video:(Video *)video{
    self = [super initWithCoder:coder];
    if (self) {
        self.video = video;
    }
    return self;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
