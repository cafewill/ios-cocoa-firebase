//
//  ViewController.m
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [Allo i : @"viewDidLoad %@", [[self class] description]];
    
    @try
    {
        [self rotateFirebase];
    } @catch (NSException* e) { [Allo i: @"error %@ %@", [e name], [e reason]]; }
}

- (void) rotateNotification : (NSDictionary*) info
{
    [Allo i : @"rotateNotification %@", [[self class] description]];

    @try
    {
        // 푸시 알림 기본 데이터
        NSDictionary* aps = [info objectForKey: @"aps"];
        NSDictionary* alert = [aps objectForKey: @"alert"];
        NSString* title = [alert objectForKey: @"title"];
        NSString* message = [alert objectForKey: @"body"];
        
        // 추가 데이터 (바로가기 링크)
        NSString* link = [info objectForKey: @"link"];

        [Allo i : @"Check notification [%@][%@][%@]", title, message, link];

        NSURL* check = [NSURL URLWithString: link];
        if (check && check.scheme && check.host)
        {
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString: link] options: @{} completionHandler: nil];
        }
    } @catch (NSException* e) { [Allo i: @"error %@ %@", [e name], [e reason]]; }
}

- (void) rotateFirebase
{
    [Allo i : @"rotateFirebase %@", [[self class] description]];

    @try
    {
        [[NSNotificationCenter defaultCenter] addObserver : self
                                              selector : @selector (rotateToken :)
                                              name : @"FCMToken"
                                              object : nil];
    } @catch (NSException* e) { [Allo i: @"error %@ %@", [e name], [e reason]]; }
}


- (void) rotateToken : (NSNotification *) notification {
    [Allo i : @"rotateToken %@", [[self class] description]];

    @try
    {
        [self registDevice: [notification userInfo][@"token"]];
    } @catch (NSException* e) { [Allo i: @"error %@ %@", [e name], [e reason]]; }
}

- (void) registDevice : (NSString*) token
{
    [Allo i : @"registDevice %@", [[self class] description]];

    @try
    {
        // 필요시 로컬 및 리모트 서버 연동하여 저장함
        [Allo i : @"Check token [%@]", token];
    } @catch (NSException* e) { [Allo i : @"error %@ %@", [e name], [e reason]]; }
}

@end
