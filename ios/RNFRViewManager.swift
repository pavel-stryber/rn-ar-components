import UIKit;
import ARKit;

@objc(RNFRViewManager)
class RNFRViewManager: RCTViewManager {
    override func view() -> UIView! {
        let view = RNFRView.init();
        return view;
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
