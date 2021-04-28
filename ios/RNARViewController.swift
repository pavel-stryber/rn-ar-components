import UIKit;
import ARKit;

class RNARViewController: UIViewController, ARSCNViewDelegate {
    let configuration = ARWorldTrackingConfiguration();
    var imageAnchors: [RNARImageAnchor] = [];
    var arView: ARSCNView? = nil;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.configuration.detectionImages = ARReferenceImage.referenceImages(inGroupNamed: "ARImages", bundle: Bundle.main)!
        arView?.delegate = self
        arView?.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin];
        arView?.session.run(configuration, options: [.resetTracking, .removeExistingAnchors]);
        arView?.autoenablesDefaultLighting = true;
    }
    override func viewDidLoad() {
        // super.viewDidLoad();
        print("view is loaded -----------------");
    }
    override func loadView() {
        arView = ARSCNView.init();
        arView?.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        self.view = arView;
    }
    
    func restartSession() {
        self.arView?.session.pause()
        self.arView?.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.arView?.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode();
        if let imageAnchor = anchor as? ARImageAnchor {
            let referenceImage = imageAnchor.referenceImage
            
            for imageAnchorView in self.imageAnchors {
                let imageName: String = referenceImage.name! as String;
                let path: String = imageAnchorView.path as String;
                let anchorName = imageAnchorView.name as String;
                if path == imageName {
                    imageAnchorView.onDetect?(["name": anchorName]);
                }
            }
            
            let tipNode = SCNNode();
            let text = SCNText(string: referenceImage.name, extrusionDepth: 2)
            // tipNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
            text.font = UIFont(name: "", size: 0.1);
            let material = SCNMaterial();                       material.diffuse.contents = UIColor.magenta;
            text.materials = [material];
            
            
            
            //tipNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
            
            //tipNode.geometry?.firstMaterial?.specular.contents = UIColor.white
            //tipNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            
            
            tipNode.geometry = text;
            tipNode.scale = SCNVector3(0.003, 0.003, 0.003);
            tipNode.rotation = SCNVector4(0, 3, 2, 3);
            tipNode.position = SCNVector3(0.08, 0, -0.02);
            
            
            
            node.addChildNode(tipNode)
            
        }
        
        return node;
    }
    
    func addImageAnchor(_ imageAnchor: RNARImageAnchor) {
        self.imageAnchors.append(imageAnchor);
    }
    
    func removeImageAnchor(_ imageAnchor: RNARImageAnchor) {
        let index = self.imageAnchors.firstIndex(of: imageAnchor);
        if let i = index {
            self.imageAnchors.remove(at: i);
        }
    }
}
