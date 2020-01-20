import UIKit
import RealityKit



class ARDemo: UIViewController {
    
    
    @IBOutlet weak var arView: ARView!
    
    var testAnchor:Testing.Box!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testAnchor = try! Testing.loadBox()
        testAnchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(testAnchor)
        
        arView.debugOptions = .showStatistics

        self.navigationController?.navigationBar.topItem?.title = ""

        print("Hello")
    }

    

    

    //MARK: Actions
    

    

    func sceneLoadAndReload() {
        arView.scene.removeAnchor(testAnchor)
        testAnchor = try! Testing.loadBox()
        testAnchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(testAnchor)
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        
        
        // Этот метод выполняет действие из композера по имени startProject
        
        testAnchor.notifications.startProject.post()
    }

    
    
    @IBAction func reloadButtonPressed(_ sender: UIBarButtonItem) {
      sceneLoadAndReload()
    }
    
}
