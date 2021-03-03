/********* TwilioAudio.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "ViewController.h"


@interface TwilioAudio : CDVPlugin {
  // Member variables go here.
}
- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation TwilioAudio

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{  
    NSString* number = command.arguments[0];
    NSString* URL = command.arguments[1];
    NSString* Identity = command.arguments[2];
    NSString* name = command.arguments[3];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"TwilioAudio" bundle:nil];
        ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
        
//        vc.kYourServerBaseURLString = token;
//        vc.kIdentity = Identity;
//        vc.kTwimlParamTo = name;
          vc.ToNumber = number;
        // UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        //  [vc.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissTwilioVideoController)]];
        
        
        [self.viewController presentViewController:vc animated:YES completion:^{
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ok"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    });
}
@end
