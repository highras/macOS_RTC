//
//  VideoTestViewController.m
//  MacosRtmTest
//
//  Created by zsl on 2021/11/15.
//

#import "VideoTestView.h"
#import <Rtm/Rtm.h>
@interface VideoTestView ()<RTMProtocol,RTMVideoProtocol>
@property(nonatomic,strong)RTMClient * client;
@property(nonatomic,strong)NSView * userView;
@end

@implementation VideoTestView

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
    
    self.client = [RTMClient clientWithEndpoint:@""
                                       projectId:0
                                          userId:222
                                        delegate:self
                                          config:nil
                                     autoRelogin:YES];
    self.client.videoDelegate = self;
    self.client.rtcEndpoint = @"rtc_Endpoint";
       
    [self _login];
            
    NSButton * initVideoEngine = [NSButton buttonWithTitle:@"1.初始化" target:self action:@selector(initVideoEngine)];
    initVideoEngine.frame = CGRectMake(250, 600, 150, 150);
    [self addSubview:initVideoEngine];
    
    
    NSButton * createVideoRoom = [NSButton buttonWithTitle:@"2.创建房间" target:self action:@selector(createVideoRoom)];
    createVideoRoom.frame = CGRectMake(250, 450, 150, 150);
    [self addSubview:createVideoRoom];
    
    
    NSButton * joinVideoRoom = [NSButton buttonWithTitle:@"3.进入房间" target:self action:@selector(joinVideoRoom)];
    joinVideoRoom.frame = CGRectMake(250, 300, 150, 150);
    [self addSubview:joinVideoRoom];
    
    NSButton * subscribeUser = [NSButton buttonWithTitle:@"4.订阅用户" target:self action:@selector(subscribeUser)];
    subscribeUser.frame = CGRectMake(250, 150, 150, 150);
    [self addSubview:subscribeUser];
    
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
            alert.informativeText = @"登陆成功";
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
-(void)initVideoEngine{
    
    RTMBaseAnswer * an = [self.client setVideoEngine:RTMCaptureVideoDefault];
    if (an.error == nil) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"视频初始化成功";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
        
    }else{
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = [NSString stringWithFormat:@"音频初始化失败  %@",an.error.ex];
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
        });
    }
        
        
}
-(void)createVideoRoom{
    
    
    [self.client createVideoRoomWithId:@(222) enableRecord:NO timeout:10 success:^(RTMVideoCreateRoomAnswer * _Nonnull answer) {
        NSLog(@"createVideoRoom 创建成功");
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
        NSLog(@"createVideoRoom 创建失败  %@",error);
        
    }];
}
-(void)joinVideoRoom{
    
    [self.client enterVideoRoomWithRoomId:@(222)
                                  timeout:10
                                  success:^(RTMVideoEnterRoomAnswer * _Nonnull answer) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"加入成功";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
            
            NSLog(@"joinVideoRoom 加入成功");
            [self.client openCamera];
            int w = 240.0/1.2;
            int h = 320.0/1.2;
            self.client.mySelfPreview.frame = CGRectMake(0, 0, w, h);
            [self addSubview:self.client.mySelfPreview];
            self.client.mySelfPreview.layer.backgroundColor = [NSColor redColor].CGColor;
            [self.client updatePreviewFrame];
            
        });
        
        

    } fail:^(FPNError * _Nullable error) {
        
        NSLog(@"joinVideoRoom 加入失败");
        
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
-(void)subscribeUser{
    
    int w = 240.0/1.2;
    int h = 320.0/1.2;
    self.userView = [[NSView alloc] initWithFrame:CGRectMake(w + 20, 0, w, h)];
    self.userView.wantsLayer = YES;
    self.userView.layer.backgroundColor = [NSColor blueColor].CGColor;
    [self addSubview:self.userView];
    [self.client updateChildrenPreviewFrame];
    
    
    [self.client subscribeVideoWithRoomId:@(222)
                                      uid:@[@(666)]
                           containerViews:@[self.userView]
                                  timeout:10 success:^{
        
        NSLog(@"subscribeUser 订阅成功");
        dispatch_async(dispatch_get_main_queue(), ^{
           
            
            NSAlert *alert = [[NSAlert alloc] init];
            alert.alertStyle = NSAlertStyleWarning;
            [alert addButtonWithTitle:@"确定"];
            alert.informativeText = @"订阅成功";
            [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow  completionHandler:^(NSModalResponse returnCode) {
                
            }];
             
            
        });
        
    } fail:^(FPNError * _Nullable error) {
        
        NSLog(@"subscribeUser 订阅失败");
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
