//
//Created by ESJsonFormatForMac on 23/06/03.
//

#import <Foundation/Foundation.h>


@interface Video : NSObject

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *actor;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *introduce;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *ppctn;

@property (nonatomic, assign) BOOL   collect;

@property (nonatomic, strong) NSData *pic;

@end
