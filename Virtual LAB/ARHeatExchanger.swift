import UIKit
import RealityKit


class ARHeatExchanger: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    
    
    var anchor: HeatExchanger.Scene1!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScene()
        setupView()
    }
    
    private func setupView() {
        Design.navBarIsTransparent(transparent: false)
    }
    
    private func loadScene() {
        anchor = try! HeatExchanger.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
    }
    
    private func reloadScene() {
        arView.scene.removeAnchor(anchor)
        loadScene()
    }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        reloadScene()
    }
    
    @IBAction func endScene(_ sender: UIButton) {
        FirebaseManager.shared.updateWorkInfo()
        performSegue(withIdentifier: Segues.returnFrom2, sender: nil)
    }
}
