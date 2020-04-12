import UIKit
import RealityKit
import Firebase


class ARColumnAssembly: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var endButton: UIButton!
    
    
    var anchor: Column.Scene1!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScene()
        setupView()
    }
    
    private func setupView() {
        anchor.actions.workDidFinished.onAction = closeScene(_:)
        anchor.actions.sceneStarted.onAction    = setupPlate(_:)
        anchor.actions.changeTitle.onAction     = setupTop(_:)
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "Перемещайте устройство"
        endButton.isHidden = true
    }
    
    func loadScene() {
        anchor = try! Column.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
    }
    
    
    func reloadScene() {
        arView.scene.removeAnchor(anchor)
//        loadScene()
        }
    
    
    
    
    func finishWork() {
        updateDataBase()
        endButton.setTitle("Завершить", for: .normal)
        endButton.isHidden = false
        navigationItem.title = "Нажмите \"Завершить\""
    }
   
    
    @IBAction func endScene(_ sender: UIButton) {
        performSegue(withIdentifier: "return", sender: nil)
    }
    
}


extension ARColumnAssembly {
    func setupPlate(_ entity: Entity?) {
              navigationItem.title = "Установите тарелки"
    }
    
    func setupTop(_ entity: Entity?) {
                navigationItem.title = "Установите крышку"
    }
    
    func closeScene(_ entity: Entity?) {
        guard entity != nil else { return }
        finishWork()
    }
}
