import UIKit

class ConfirmEmailReminderCoordinator {

    private let delegate: ConfirmEmailReminderCoordinatorDelegate

    init(delegate: ConfirmEmailReminderCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let viewController = UIAlertController(
            title: "Check your email",
            message: "Complete your registration via the link sent to you in an email",
            preferredStyle: .alert)
        let delegate = self.delegate
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            delegate.didTapEmailReminderOK()
        }
        viewController.addAction(action)
        return viewController
    }
}

protocol ConfirmEmailReminderCoordinatorDelegate {

    func didTapEmailReminderOK()
}
