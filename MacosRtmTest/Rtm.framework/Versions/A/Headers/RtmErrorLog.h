//
//  RtmErrorLog.h
//  Rtm
//
//  Created by zsl on 2021/2/26.
//  Copyright © 2021 FunPlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTMClient.h"
class RtmErrorLogCppToOc{
    
public:
    
    static void logString(char * _Nullable log);
    
};

NS_ASSUME_NONNULL_BEGIN

@interface RtmErrorLog : NSObject
+ (instancetype)sharedManager;
+(void)exportErrorLog:(NSString*)log;
+(void)exportErrorLogNeedTime:(NSString*)log;
+(void)registerClient:(RTMClient*)client;
@property(nonatomic,strong)NSHashTable * weakTable;
@end

NS_ASSUME_NONNULL_END


