#import "ViewUtils.h"

@implementation ViewUtils
+(BOOL)isLandscape{
    if (@available(iOS 13.0, *)) {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.windows.firstObject.windowScene.interfaceOrientation);
    } else {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation);
    }
}
@end
