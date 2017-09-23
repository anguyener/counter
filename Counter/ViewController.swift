import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numCount: UILabel!
    
    @IBOutlet weak var labelConstraint: NSLayoutConstraint!
    
    @IBOutlet var screen: UIView!
    
    var count = 0
    
    //These variables prevent the label from going off of the top/bottom of the phone initially set for portrait mode
    var upBound = 250
    var downBound = -250
    
    
    //When up button is pressed causes the label numCount to move up and increment
    @IBAction func upButtonTapped(_ sender: Any) {
        moveAndUpdateCounter(increment: 5)
    }
    
    //When down button is pressed causes the label numCount to move down and decrement
    @IBAction func downButtonTapped(_ sender: Any) {
        moveAndUpdateCounter(increment: -5)
    }
    
    //Increments/Decrements the counter as long as it's in the bounds which change depending on whether the device is in portrait or landscape mode
    //Paramenter increment is an Int, set in the upButtonTapped/downButtonTapped functions
    func moveAndUpdateCounter(increment: Int){
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            upBound = 145
            downBound = -145
        }
        if count < upBound && increment > 0 {
            count+=increment
            numCount.text="\(count)"
            labelConstraint.constant -= CGFloat(increment)
            view.setNeedsLayout()
        }
        else if increment < 0 && count > downBound {
            count+=increment
            numCount.text="\(count)"
            labelConstraint.constant -= CGFloat(increment)
            view.setNeedsLayout()
        }
    }
}
