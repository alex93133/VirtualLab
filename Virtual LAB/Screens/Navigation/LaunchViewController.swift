import UIKit

class LaunchViewController: UIViewController {
    
    private var circleLayer = CAShapeLayer()
    private var height: CGFloat!
    private var width: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeFigure()
        startCircleAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: Segues.launch, sender: nil)
        }
    }
    
    private func makeFigure() {
        height = view.frame.size.height
        width = view.frame.size.width
        
        let path = UIBezierPath(roundedRect: CGRect(x: 0 - width/2, y: height , width: 2 * width, height: height + width), byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: width, height: width))
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor(named: "BackgroundColor")!.cgColor
        
        view.layer.addSublayer(circleLayer)
    }
    
    private func startCircleAnimation() {
        let position = CGPoint(x: 0, y: 0 - height - height / 4)
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = circleLayer.position
        animation.toValue = position
        animation.duration = 1
        circleLayer.position = position
        circleLayer.add(animation, forKey: "position")
    }
}
