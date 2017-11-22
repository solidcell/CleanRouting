import UIKit

class MapCoordinator: MenuCoordinatorDelegate {

    private weak var viewController: UIViewController?

    func start() -> UIViewController {
        let interactor = MapInteractor(coordinator: self)
        let viewController = MapViewController(interactor: interactor)
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

    private func closeMenu() {
        viewController?.dismiss(animated: true)
    }
}

