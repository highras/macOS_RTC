//
//  RTMClient+RealTimeP2PVideoInterface.h
//  Rtm
//
//  Created by zsl on 2022/2/28.
//  Copyright © 2022 FunPlus. All rights reserved.
//

#import <Rtm/Rtm.h>

NS_ASSUME_NONNULL_BEGIN
@interface RTMClient (RealTimeP2PVideoInterface)


-(void)requestP2PVideoWithUserId:(NSNumber * _Nonnull)userId
               captureVideoLevel:(RTMCaptureVideoLevel)captureVideoLevel
                         timeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)cancelP2PVideoWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;
    
-(void)closeP2PVideoWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)acceptP2PVideoWithTimeout:(int)timeout
               captureVideoLevel:(RTMCaptureVideoLevel)captureVideoLevel
                   containerView:(NSView*)containerView
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;

-(void)refuseP2PVideoWithTimeout:(int)timeout
                         success:(void(^)(void))successCallback
                            fail:(RTMAnswerFailCallBack)failCallback;
@end

NS_ASSUME_NONNULL_END
