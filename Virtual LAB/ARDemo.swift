import UIKit
import RealityKit
import Firebase



class ARDemo: UIViewController {
    
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var startButton: UIButton!
    
    
    var anchor: Coloumn.Scene1!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        loadScene()
        anchor.actions.workDidFinished.onAction = handleTapOnEntity(_:)
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    //MARK: Actions
    
    func loadScene() {
        anchor = try! Coloumn.loadScene1()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(anchor)
     
    }
    
    
    func reloadScene() {
        arView.scene.removeAnchor(anchor)
        loadScene()
        startButton.isHidden = false
        }
    
    
    func updateDataBase() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let userInfoRef = self.ref.child("Users").child(userID)
        userInfoRef.updateChildValues(["workDidFinished": true])
    }
    
    
    func finishWork() {
        updateDataBase()
        startButton.titleLabel?.text = "Завершить"
        startButton.isHidden = false
        print("Hello")
    }
    
    
    func handleTapOnEntity(_ entity: Entity?) {
        guard entity != nil else { return }
        finishWork()
    }
    
    @IBAction func start(_ sender: UIButton) {
        anchor.notifications.startScene.post()
        startButton.isHidden = true
        if startButton.titleLabel?.text == "Завершить" {
            performSegue(withIdentifier: "fromARDemoToWorkResult", sender: nil)
        }
    }
    
    
    @IBAction func reloadButtonPressed(_ sender: UIBarButtonItem) {
        reloadScene()
    }
    
}
