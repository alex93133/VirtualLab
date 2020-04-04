import UIKit
import RealityKit
import Firebase


class ARDemoViewController: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var endButton: UIButton!
    
    
    var anchor: Coloumn.Scene1!
    var ref: DatabaseReference!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        loadScene()
        setupView()
    }
    
    private func setupView() {
        anchor.actions.workDidFinished.onAction = closeScene(_:)
        anchor.actions.sceneStarted.onAction    = setupPlate(_:)
        anchor.actions.changeTitle.onAction     = setupTop(_:)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "Перемещайте устройство"
        endButton.isHidden = true
    }
    
    func loadScene() {
        anchor = try! Coloumn.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
    }
    
    
    func reloadScene() {
        arView.scene.removeAnchor(anchor)
//        loadScene()
        }
    
    
    func updateDataBase() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let userInfoRef = self.ref.child("Users").child(userID)
        userInfoRef.updateChildValues(["workDidFinished": true])
    }
    
    func finishWork() {
        updateDataBase()
        endButton.setTitle("Завершить", for: .normal)
        endButton.isHidden = false
         self.navigationItem.title = "Нажмите \"Завершить\""
    }
   
    
    @IBAction func endScene(_ sender: UIButton) {
        performSegue(withIdentifier: "return", sender: nil)
    }
    
}


extension ARDemoViewController {
    func setupPlate(_ entity: Entity?) {
              self.navigationItem.title = "Установите тарелки"
    }
    
    func setupTop(_ entity: Entity?) {
                self.navigationItem.title = "Установите крышку"
    }
    
    func closeScene(_ entity: Entity?) {
        guard entity != nil else { return }
        finishWork()
    }
}
