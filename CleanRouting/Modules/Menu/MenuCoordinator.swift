import UIKit

struct MenuCoordinator {

    private let delegate: MenuCoordinatorDelegate

    init(delegate: MenuCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let interactor = MenuInteractor(coordinator: self)
        let viewController = MenuViewController(interactor: interactor)
        return viewController
    }

    func didTapClose() {
        delegate.didTapCloseInMenu()
    }
}

protocol MenuCoordinatorDelegate {

    func didTapCloseInMenu()
}
