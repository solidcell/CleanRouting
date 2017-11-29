import UIKit

class SignupCredentialsCoordinator {

    private let delegate: SignupCredentialsCoordinatorDelegate

    init(delegate: SignupCredentialsCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start(usage: SignupCredentialsViewController.Usage) -> UIViewController {
        let viewController = SignupCredentialsViewController(coordinator: self, usage: usage)
        return viewController
    }

    func didTapNext() {
        delegate.didFinishSignupCredentials()
    }
}

protocol SignupCredentialsCoordinatorDelegate {

    func didFinishSignupCredentials()
}
