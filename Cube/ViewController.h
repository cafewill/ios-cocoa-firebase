//
//  ViewController.h
//

#import <UIKit/UIKit.h>
#import "Allo.h"
#import "UIView+Toast.h"
#import "NSString+Addtions.h"

@interface ViewController : UIViewController

- (void) rotateFirebase;
- (void) registDevice : (NSString*) token;
- (void) rotateNotification : (NSDictionary*) info;
- (void) rotateToken : (NSNotification *) notification;

@end

