
#import <Foundation/Foundation.h>

@interface ExceptionHandler : NSObject

+ (BOOL)catchException:(void (^)(void))tryBlock error:(NSError **)error;

@end
