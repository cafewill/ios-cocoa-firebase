//
//  Allo.h
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

#define CUBE @"cube"
#define CUBE_DEBUG YES


@interface Allo : NSObject

+ (void) i: (NSString*) format, ...;
+ (void) t: (NSString*) format, ...;

@end
