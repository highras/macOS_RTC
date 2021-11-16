//
//  FPNNAnswer.h
//  Rtm
//
//  Created by zsl on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "FPNError.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPNNAnswer : NSObject

@property(nonatomic,strong)NSDictionary *responseData;
@property(nonatomic,strong)FPNError *error;

- (instancetype)initWithMessage:(NSDictionary * _Nullable)message;
- (instancetype)initWithError:(FPNError * _Nullable)error;

+ (instancetype)answerWithMessage:(NSDictionary * _Nullable)message;
+ (instancetype)answerWithError:(FPNError * _Nullable)error;

+ (instancetype)emptyAnswer;

@end

NS_ASSUME_NONNULL_END
