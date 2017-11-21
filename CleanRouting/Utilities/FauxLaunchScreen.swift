import UIKit

// I tried grabbing the view from the LaunchScreen and just calling
// addSubview on the one (and only) window, but it wasn't as reliable
// as using a new window on a new level. For instance, presenting one
// view controller on top of the root view controller was fine, but if
// another view controller were presented on top of that one, it would
// appear above this view.

class FauxLaunchScreen {

    private var curtainWindow: UIWindow!

    func show() {
        curtainWindow = UIWindow(frame: UIScreen.main.bounds)
        curtainWindow.rootViewController =  UIStoryboard(name: "LaunchScreen", bundle: nil)
            .instantiateInitialViewController()!
        curtainWindow.windowLevel = UIWindowLevelNormal + 1
        curtainWindow.makeKeyAndVisible()
    }

    func hide() {
        UIView.animate(
            withDuration: 1.5,
            animations: {
                self.curtainWindow.alpha = 0
            },
            completion: { _ in
                self.curtainWindow = nil
            })
    }
}
