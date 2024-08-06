#import "ExceptionHandler.h"

@implementation ExceptionHandler

+ (BOOL)catchException:(void (^)(void))tryBlock error:(NSError **)error {
    @try {
        tryBlock();
        return YES;
    } @catch (NSException *exception) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:exception.name code:-1 userInfo:@{
                NSUnderlyingErrorKey: exception,
                NSLocalizedDescriptionKey: exception.reason,
                @"CallStackSymbols": exception.callStackSymbols
            }];
        }
        return NO;
    }
}

@end
