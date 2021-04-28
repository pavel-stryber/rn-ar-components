import UIKit;
import ARKit;

class RNFRView: UIView {
    let frController = RNFRViewController.init();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.reactAddController(toClosestParent: frController);
        self.addSubview(frController.view);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
