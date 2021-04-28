import UIKit;
import ARKit;

class RNARView: UIView {
    let arController = RNARViewController.init();
    @objc func restartSession() {
        self.arController.restartSession();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.reactAddController(toClosestParent: arController);
        self.addSubview(arController.view);
    }
    
    override func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
        super.insertReactSubview(subview, at: atIndex);
        if let sb = subview as? RNARImageAnchor {
            print("added ImageAnchor subview");
            sb.arController = arController;
            arController.addImageAnchor(sb);
        }
    }
    
    override func removeReactSubview(_ subview: UIView!) {
        if let sb = subview as? RNARImageAnchor {
            print("removed ImageAnchor subview");
            arController.removeImageAnchor(sb);
        }
        super.removeReactSubview(subview);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
