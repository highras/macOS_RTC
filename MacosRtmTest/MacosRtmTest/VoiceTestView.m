//
//  VoiceTestViewController.m
//  MacosRtmTest
//
//  Created by zsl on 2021/11/15.
//

#import "VoiceTestView.h"
#import <Rtm/Rtm.h>
#import "AppDelegate.h"
@interface VoiceTestView ()<RTMProtocol,RTMVoiceProtocol>
@property(nonatomic,strong)RTMClient * client;
@end

@implementation VoiceTestView
-(instancetype)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        [self _initView];
    }
    return self;
}

- (void)_initView {
    
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor grayColor].CGColor;
    
    //init
    self.client = [RTMClient clientWithEndpoint:@""
                                       projectId:0
                                          userId:222
                                        delegate:self
                                          config:nil
                                     autoRelogin:YES];
    self.client.voiceDelegate = self;
    self.client.rtcEndpoint = @"rtc_Endpoint";
       
    [self _login];
    
    NSButton * initVoiceEngine = [NSButton buttonWithTitle:@"1.初始化" target:self action:@selector(initVoiceEngine)];
    initVoiceEngine.frame = CGRectMake(250, 500, 150, 150);
    [self addSubview:initVoiceEngine];
    
    
    NSButton * createVoiceRoom = [NSButton buttonWithTitle:@"2.创建房间" target:self action:@selector(createVoiceRoom)];
    createVoiceRoom.frame = CGRectMake(250, 350, 150, 150);
    [self addSubview:createVoiceRoom];
    
    
    NSButton * joinVoiceRoom = [NSButton buttonWithTitle:@"3.进入房间" target:self action:@selector(joinVoiceRoom)];
    joinVoiceRoom.frame = CGRectMake(250, 200, 150, 150);
    [self addSubview:joinVoiceRoom];
    
}
-(void)_login{
    
    [self.client loginWithToken:@"2AEDB1F53412CC42725B63BB2FE3ABD0"
                       language:@"en"
                      attribute:@{@"attribute":@"attribute"}
                        timeout:20
                        success:^{
        
        NSLog(@"loginWithToken success");
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"登陆成功 用户ID ：222";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
    
        

    } connectFail:^(FPNError * _Nullable error) {

        NSLog(@"loginWithToken error  %@",error);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = [NSString stringWithFormat:@"登陆失败 %@",error.ex];
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });

    }];
}
-(void)rtmErrorLog:(NSString *)errorLog{
    NSLog(@" rtmErrorLog  %@",errorLog);
    
}
//重连
-(void)rtmReloginCompleted:(RTMClient *)client reloginCount:(int)reloginCount reloginResult:(BOOL)reloginResult error:(FPNError *)error{
    
    NSLog(@"rtmReloginCompleted  %d",reloginResult);
}
-(BOOL)rtmReloginWillStart:(RTMClient *)client reloginCount:(int)reloginCount{
    
    NSLog(@"rtmReloginWillStart  reloginCount = %d  uid = %lld   %@",reloginCount,client.userId,client);
    return YES;
}
-(void)initVoiceEngine{
    
    if ([self.client setAudioEngineWithDualChannel:NO].error == nil) {
        NSLog(@"音频初始化成功");
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"音频初始化成功";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
    }else{
        NSLog(@"音频初始化失败");
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"音频初始化失败";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
    }
        
}
-(void)createVoiceRoom{
    
    
    [self.client createVoiceRoomWithId:@(222) enableRecord:NO timeout:10 success:^(RTMVoiceCreateRoomAnswer * _Nonnull answer) {
       
        NSLog(@"createVoiceRoom 创建成功");
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"创建成功";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
        
    } fail:^(FPNError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = [NSString stringWithFormat:@"fail %@",error.ex];
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
        NSLog(@"createVoiceRoom 创建失败  %@",error);
        
    }];
}
-(void)joinVoiceRoom{
    
    [self.client enterVoiceRoomWithRoomId:@(222)
                                  timeout:10
                                  success:^(RTMVoiceEnterRoomAnswer * _Nonnull an) {

        NSLog(@"joinVoiceRoom 加入成功");
        BOOL result = [self.client setCurrentVoiceActiveRoom:222];
        if (result == YES) {
            NSLog(@"设置活跃房间成功");
            self.client.isOpenVoiceSpeak = YES;
            self.client.isOpenVoicePlay = YES;
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                NSAlert *alert = [[NSAlert alloc] init];
                alert.alertStyle = NSAlertStyleWarning;
                [alert addButtonWithTitle:@"确定"];
                alert.informativeText = @"加入成功，并将当前房间设置为活跃房间";
                [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                    
                }];
                 
            });
            
        }else{
            NSLog(@"设置活跃房间失败");
        }

    } fail:^(FPNError * _Nullable error) {
        
        NSLog(@"joinVoiceRoom 加入失败");
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = [NSString stringWithFormat:@"fail %@",error.ex];
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
        
    }];
        
}

@end
