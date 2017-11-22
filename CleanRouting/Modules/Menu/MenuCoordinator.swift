import UIKit

class MenuCoordinator: LoginCoordinatorDelegate {

    private let delegate: MenuCoordinatorDelegate
    private weak var viewController: UIViewController?

    init(delegate: MenuCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let interactor = MenuInteractor(coordinator: self)
        let viewController = MenuViewController(interactor: interactor, loggedIn: UserStore.loggedIn)
        self.viewController = viewController
        return viewController
    }

    func didTapClose() {
        delegate.didTapCloseInMenu()
    }

    func didTapLogOut() {
        delegate.didTapLogOutInMenu()
    }

    func didTapLogIn() {
        let loginViewController = LoginCoordinator(delegate: self).start()
        viewController?.present(loginViewController, animated: true)
    }

    func didLogIn() {
        delegate.didLogInInMenu()
    }

    func didCancelLogIn() {
        viewController?.dismiss(animated: true)
    }
}

protocol MenuCoordinatorDelegate {

    func didTapCloseInMenu()
    func didTapLogOutInMenu()
    func didLogInInMenu()
}
