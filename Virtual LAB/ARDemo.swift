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
        
//        arView.debugOptions = .showStatistics

        self.navigationController?.navigationBar.topItem?.title = ""

        print("Hello")
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boxTapped(touch:)))
        self.arView.addGestureRecognizer(gestureRecognizer)
    }

    

    

    //MARK: Actions
    
     @objc func boxTapped(touch: UITapGestureRecognizer) {
           let sceneView = touch.view as! ARView
        _ = touch.location(in: sceneView)
           
//        let touchResults = sceneView.hitTest(touchLocation, types: .existingPlaneUsingGeometry)
//        
//        print(touchResults)
           
       }
    

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
