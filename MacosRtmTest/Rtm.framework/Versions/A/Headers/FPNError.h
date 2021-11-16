//
//  FPNError.h
//  Rtm
//
//  Created by zsl on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPNError : NSObject
@property (nonatomic,assign) int code;
@property (nonatomic,strong) NSString * ex;
-(instancetype)initWithEx:(NSString*)ex code:(int)code;
+(instancetype)errorWithEx:(NSString*)ex code:(int)code;
@end

NS_ASSUME_NONNULL_END
