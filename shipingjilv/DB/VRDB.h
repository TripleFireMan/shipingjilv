//
//  VRDB.h
//  VideoRecord
//
//  Created by chengyan on 2023/4/20.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
NS_ASSUME_NONNULL_BEGIN

#define DB  [[VRDB shared] db]

@interface VRDB : NSObject

@property (nonatomic, strong) FMDatabaseQueue *db;

+ (instancetype) shared;

@end

NS_ASSUME_NONNULL_END
