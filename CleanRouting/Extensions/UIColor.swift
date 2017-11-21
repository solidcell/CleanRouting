import UIKit

extension UIColor {

    static var randomGray: UIColor {
        return UIColor(white: (CGFloat(arc4random() % 90) / 256.0) + 0.3, alpha: 1)
    }
}
