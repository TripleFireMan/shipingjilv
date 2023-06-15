//
//  MoreVC.m
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import "MoreVC.h"

@interface MoreVC ()

@end

@implementation MoreVC
- (IBAction)yinsi:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"userregiest" ofType:@"html"]];
    CYH5ViewController *h5 = [[CYH5ViewController alloc] initWithURL:url];
    [self.navigationController pushViewController:h5 animated:YES];
}
- (IBAction)yhxieyi:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"private" ofType:@"html"]];
    CYH5ViewController *h5 = [[CYH5ViewController alloc] initWithURL:url];
    [self.navigationController pushViewController:h5 animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
