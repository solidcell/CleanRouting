import UIKit

class MenuCoordinator: LoginCoordinatorDelegate, SignupCoordinatorDelegate {

    private let delegate: MenuCoordinatorDelegate
    private weak var viewController: UIViewController?

    init(delegate: MenuCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let viewController = MenuViewController(coordinator: self, loggedIn: UserStore.loggedIn)
        self.viewController = viewController
        return viewController
    }

    func didTapClose() {
        delegate.didTapCloseInMenu()
    }

    func didLogOut() {
        delegate.didTapLogOutInMenu()
    }

    func didTapLogIn() {
        let loginViewController = LoginCoordinator(delegate: self).start()
        viewController?.present(loginViewController, animated: true)
    }

    func didTapSignUp() {
        let signupViewController = SignupCoordinator(delegate: self).start()
        viewController?.present(signupViewController, animated: true)
    }

    func didLogIn() {
        delegate.didLogInInMenu()
    }

    func didCancelLogIn() {
        viewController?.dismiss(animated: true)
    }

    func didFinishSignup() {
        delegate.didSignUpInMenu()
    }
}

protocol MenuCoordinatorDelegate {

    func didTapCloseInMenu()
    func didTapLogOutInMenu()
    func didLogInInMenu()
    func didSignUpInMenu()
}
