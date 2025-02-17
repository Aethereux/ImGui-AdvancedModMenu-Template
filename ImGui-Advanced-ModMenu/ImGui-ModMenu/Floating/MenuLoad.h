#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuLoad : NSObject

+ (MenuLoad* )getInstance;
- (void) initTapGes;

@end

@interface MenuInteraction : UIView
@end

NS_ASSUME_NONNULL_END

