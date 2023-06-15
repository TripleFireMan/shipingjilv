//
//  VRDB.m
//  VideoRecord
//
//  Created by chengyan on 2023/4/20.
//

#import "VRDB.h"

@implementation VRDB
+ (instancetype) shared {
    static VRDB *db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [VRDB new];
    });
    return db;
}

- (FMDatabaseQueue *)db{
    if (!_db){
        NSString *url = [[NSBundle mainBundle] pathForResource:@"videos" ofType:@"sqlite"];
        NSURL *fileurl = [NSURL fileURLWithPath:url];
        _db = [FMDatabaseQueue databaseQueueWithURL:fileurl];
    }
    return _db;
}
@end
