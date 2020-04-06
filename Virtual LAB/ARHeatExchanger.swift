import UIKit
import RealityKit


class ARHeatExchanger: UIViewController {

    @IBOutlet weak var arView: ARView!
    
    
    var anchor: HeatExchanger.Scene1!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScene()
    }
    
    
    func loadScene() {
        anchor = try! HeatExchanger.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
    }
    
     func reloadScene() {
            arView.scene.removeAnchor(anchor)
            loadScene()
            }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        reloadScene()
    }
    


}
