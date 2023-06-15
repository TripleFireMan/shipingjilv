//
//  HomeSquareCell.m
//  shipingjilv
//
//  Created by chengyan on 2023/6/11.
//

#import "HomeSquareCell.h"

@implementation HomeSquareCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.xj addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapXJ:)]];
    [self.aq addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapAq:)]];
    [self.ox addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapOx:)]];
    [self.qc addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapQC:)]];

}
- (void)handleTapOx:(id)sender {
    self.Tapges?self.Tapges(4):nil;
}

- (void)handleTapXJ:(id)sender {
    self.Tapges?self.Tapges(3):nil;
}

- (void)handleTapAq:(id)sender {
    self.Tapges?self.Tapges(2):nil;
}

- (void)handleTapQC:(id)sender {
    self.Tapges?self.Tapges(1):nil;
}
@end
