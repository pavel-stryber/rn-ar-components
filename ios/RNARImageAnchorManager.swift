import UIKit;
import ARKit;

@objc(RNARImageAnchorManager)
class RNARImageAnchorManager: RCTViewManager {
    override func view() -> UIView! {
        let view = RNARImageAnchor.init();
        return view;
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
