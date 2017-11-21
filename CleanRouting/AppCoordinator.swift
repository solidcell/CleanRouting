import UIKit

class AppCoordinator: OnboardingCoordinatorDelegate {

    private let viewController = MapViewController()

    func start(on window: UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        presentOnboarding()
    }

    private func presentOnboarding() {

        // The root view controller can't present another view controller on
        // the same run loop cycle without getting the warning:
        // `Unbalanced calls to begin/end appearance transitions for ...`
        // or
        // `Attempt to present ... on ... whose view is not in the window hierarchy!`
        // So, to start the app with a view controller already presented over
        // another one, ready to be dismissed, it must be presented after
        // `application(_:didFinishLaunchingWithOptions:)`, on the next run loop
        // cycle. Thus, `DispatchQueue.main.async`.
        // However, even with `animated: false`, there will sometimes be a flicker
        // where the user sees the presenting view controller. So, we have a
        // faux launch screen which we can hide whenever the present is finished.
        // If there is a flicker, it will be masked by the faux launch screen.

        let fauxLaunchScreen = FauxLaunchScreen()
        fauxLaunchScreen.show()

        let onboardingViewController = OnboardingCoordinator(delegate: self).start()

        DispatchQueue.main.async {
            self.viewController.present(onboardingViewController, animated: false) {
                fauxLaunchScreen.hide()
            }
        }
    }

    func didTapSkipToMapInOnboarding() {
        dismissOnboarding()
    }

    func didLogInInOnboarding() {
        dismissOnboarding()
    }

    func didSignUpInOnboarding() {
        dismissOnboarding()
    }

    private func dismissOnboarding() {
        viewController.dismiss(animated: true)
    }
}
