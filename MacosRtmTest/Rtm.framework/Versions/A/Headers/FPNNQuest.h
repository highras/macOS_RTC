//
//  FPNNQuest.h
//  Rtm
//
//  Created by zsl on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPNNQuest : NSObject
@property(nonatomic,readonly,assign)BOOL twoWay;
@property(nonatomic,readonly,strong)NSDictionary * message;
@property(nonatomic,readonly,strong)NSString * method;


- (instancetype _Nullable)initWithMethod:(NSString * _Nonnull)method
                                 message:(NSDictionary * _Nullable)message
                                  twoWay:(BOOL)isTwoWay
                                     pid:(NSString * _Nullable)pid;//Rtm专用 传pid

+ (instancetype _Nullable)questWithMethod:(NSString * _Nonnull)method
                                  message:(NSDictionary * _Nullable)message
                                   twoWay:(BOOL)isTwoWay
                                      pid:(NSString * _Nullable)pid;//Rtm专用 传pid

+ (instancetype _Nullable)questWithMethod:(NSString * _Nonnull)method
                                  message:(NSDictionary * _Nullable)message
                                   twoWay:(BOOL)isTwoWay;


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
