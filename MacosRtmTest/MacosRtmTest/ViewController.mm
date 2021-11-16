//
//  ViewController.m
//  MacosRtmTest
//
//  Created by zsl on 2021/10/11.
//
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"
#import "VoiceTestView.h"
#import "VideoTestView.h"
#import <Cocoa/Cocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor grayColor].CGColor;
    
        
    NSButton * voice = [NSButton buttonWithTitle:@"实时语音" target:self action:@selector(voiceClick)];
    voice.frame = CGRectMake(250, 300, 200, 200);
    [self.view addSubview:voice];
    
    
    NSButton * video = [NSButton buttonWithTitle:@"实时视频" target:self action:@selector(videoClick)];
    video.frame = CGRectMake(250, 200, 200, 200);
    [self.view addSubview:video];
    
    
}
-(void)voiceClick{
    VoiceTestView * testView = [[VoiceTestView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:testView];
}
-(void)videoClick{
    VideoTestView * testView = [[VideoTestView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:testView];
}
-(void)click{
    
    
       
    
//    NSString * wavPath = [[NSBundle mainBundle] pathForResource:@"16 16 1 wav" ofType:@"wav"];
//    NSLog(@"asdadasd  %@",wavPath);
//    NSTimeInterval durationTime = [RtmVoiceConverterManager audioDurationFromURL:wavPath];
//    NSLog(@"durationTime   -- %f",durationTime);
//    NSString * amrPath = [RtmVoiceConverterManager voiceConvertWavToAmrFromFilePath:wavPath];
//    NSLog(@"amrPath   -- %f",amrPath);
//    NSData * amrData = [NSData dataWithContentsOfFile:amrPath];
//    NSLog(@"amrData  %@",amrData);
//    NSString * deAmrPath = [RtmVoiceConverterManager voiceConvertAmrToWavWithData:amrData];
//    NSLog(@"deAmrPath  %@",deAmrPath);
    
//    self.recordManager = [[RTMRecordManager alloc] init];
//    [self.recordManager startRecordWithLang:@"zh-CN"];
    
//    if ([self.client setAudioEngineWithDualChannel:NO].error == nil) {
//        NSLog(@"音频初始化成功");
//    }else{
//        NSLog(@"音频初始化失败");
//    }
    
    
    
}
-(void)click2{
    
}
-(void)click3{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0), ^{
//        [self.recordManager stopRecord:^(RTMAudioModel * audioModel) {
//
//            if (audioModel.audioFilePath != nil  && audioModel.duration > 0) {
//
//                NSLog(@"%@  %d",audioModel.audioFilePath,audioModel.duration);
//                [[RTMAudioplayer shareInstance] playWithAudioModel:audioModel];
//                [RTMAudioplayer shareInstance].playFinish = ^{
//                    NSLog(@"play finish");
//
////                                self.client.voiceActiveRoom = 998;
//                };
//
////                            [[RTMAudioplayer shareInstance] stop];
//
//
//
//            }else{
//                NSLog(@"播放失败");
//            }
//        }];
//    });
//
}
//-(void)click5{
////    self.userView.frame = CGRectMake(400, 0, 120, 160);
//    [self.userView mas_updateConstraints:^(MASConstraintMaker *make) {
////        make.left.equalTo(@400);
////        make.bottom.equalTo(@(0));
//        make.width.equalTo(@(120 ));
//        make.height.equalTo(@(160 ));
//    }];
//    [self.client updateChildrenPreviewFrame];
//
//    [self.client.mySelfPreview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(240 * 1.5));
//        make.height.equalTo(@(320 * 1.5));
//    }];
//
////    self.client.mySelfPreview.frame = CGRectMake(0, 0, 120, 160);
//    [self.client updatePreviewFrame];
//}
//- (void)setRepresentedObject:(id)representedObject {
//    [super setRepresentedObject:representedObject];
//
//    // Update the view, if already loaded.
//}


@end
