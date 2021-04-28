import UIKit;
import ARKit;

class RNFRViewController: UIViewController, ARSCNViewDelegate {
    let configuration = ARFaceTrackingConfiguration();
    var frView: ARSCNView? = nil;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.configuration.isLightEstimationEnabled = true;
        frView?.delegate = self
        frView?.session.run(configuration, options: [.resetTracking, .removeExistingAnchors]);
    }
    override func viewDidLoad() {
        // super.viewDidLoad();
        print("view is loaded -----------------");
    }
    
    override func loadView() {
        frView = ARSCNView.init();
        frView?.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        self.view = frView;
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = frView?.device else {
            return nil
        }
        
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines
        
        return node
    }
        
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
                return
        }
        faceGeometry.update(from: faceAnchor.geometry)
    }
}
