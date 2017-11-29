import UIKit

class MapCoordinator: MenuCoordinatorDelegate {

    private weak var viewController: UIViewController?

    func start() -> UIViewController {
        let viewController = MapViewController(coordinator: self)
        self.viewController = viewController
        return viewController
    }

    func didTapMenu() {
        let menuViewController = MenuCoordinator(delegate: self).start()
        viewController?.present(menuViewController, animated: true)
    }

    func didTapCloseInMenu() {
        closeMenu()
    }

    func didTapLogOutInMenu() {
        closeMenu()
    }

    func didLogInInMenu() {
        closeMenu()
    }

    func didSignUpInMenu() {
        closeMenu()
    }

    private func closeMenu() {
        viewController?.dismiss(animated: true)
    }
}

