import UIKit;
import ARKit;

@objc(RNARViewManager)
class RNARViewManager: RCTViewManager {
    @objc func restartSessionFromManager(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! RNARView;
            component.restartSession()
        }
    }
    override func view() -> UIView! {
        let view = RNARView.init();
        return view;
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
