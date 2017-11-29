import UIKit

class LoginCoordinator {

    private let delegate: LoginCoordinatorDelegate
    private weak var viewController: UIViewController?

    init(delegate: LoginCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let viewController = LoginViewController(coordinator: self)
        self.viewController = viewController
        return viewController
    }

    func didLogIn() {
        delegate.didLogIn()
    }

    func didCancelLogIn() {
        delegate.didCancelLogIn()
    }
}

protocol LoginCoordinatorDelegate {

    func didLogIn()
    func didCancelLogIn()
}
