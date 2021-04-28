#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_REMAP_MODULE(ImageAnchor, RNARImageAnchorManager, RCTViewManager)
    RCT_EXPORT_VIEW_PROPERTY(name, NSString)
    RCT_EXPORT_VIEW_PROPERTY(path, NSString)
    RCT_EXPORT_VIEW_PROPERTY(onDetect, RCTDirectEventBlock)
@end
