//
//  RTMClient+RealTimeP2PInterface.h
//  Rtm
//
//  Created by zsl on 2022/2/7.
//  Copyright © 2022 FunPlus. All rights reserved.
//

#import <Rtm/Rtm.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTMClient (RealTimeP2PAudioInterface)


-(void)requestP2PVoiceWithUserId:(NSNumber * _Nonnull)userId
                         timeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)cancelP2PVoiceWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;
    
-(void)closeP2PVoiceWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)acceptP2PVoiceWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)refuseP2PVoiceWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;


@end

NS_ASSUME_NONNULL_END
