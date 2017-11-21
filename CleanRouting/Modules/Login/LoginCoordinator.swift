import UIKit

class LoginCoordinator {

    private let delegate: LoginCoordinatorDelegate
    private weak var viewController: UIViewController?

    init(delegate: LoginCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let interactor = LoginInteractor(coordinator: self)
        let viewController = LoginViewController(interactor: interactor)
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
