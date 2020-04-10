import UIKit
import RealityKit


class ARColumnAssembly: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var endButton: UIButton!
    
    
    var anchor: ColumnAssembly.Scene1!

 
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
        anchor = try! ColumnAssembly.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
    }
    
    
    func reloadScene() {
        arView.scene.removeAnchor(anchor)
        loadScene()
        }
    
    func finishWork() {
        FirebaseManager.shared.updateWorkInfo()
        endButton.setTitle("Завершить", for: .normal)
        endButton.isHidden = false
        navigationItem.title = "Нажмите \"Завершить\""
    }
   
    
    
    @IBAction func reloadButtonPressed(_ sender: UIBarButtonItem) {
        reloadScene()
    }
    
    @IBAction func endScene(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.returnFrom1, sender: nil)
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
