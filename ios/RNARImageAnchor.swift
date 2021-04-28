import UIKit;
import ARKit;

class RNARImageAnchor: UIView {
    let id: String;
    @objc var name: NSString = "";
    @objc var path: NSString = "" {
        didSet {
            print("property has changed");
        }
    };
    @objc var onDetect: RCTDirectEventBlock?;
    var arController: RNARViewController? = nil;
    
    init() {
        self.id = UUID().uuidString;
        super.init(frame: .zero);
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
