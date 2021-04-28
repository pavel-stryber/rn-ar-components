#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_REMAP_MODULE(ARView, RNARViewManager, NSObject)
    RCT_EXTERN_METHOD(
      restartSessionFromManager:(nonnull NSNumber *)node
    )
@end
