#import <UIKit/UIKit.h>

%hook UIApplication

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL orig = %orig;
    
    // تنفيذ عملية فتح الرابط بعد بدء تشغيل التطبيق بلحظات لضمان عمل السياق
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_query(), ^{
        NSURL *url = [NSURL URLWithString:@"https://t.me/turath_st/"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    });
    
    return orig;
}

%end
