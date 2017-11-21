import UIKit

class SignupCredentialsCoordinator {

    private let delegate: SignupCredentialsCoordinatorDelegate

    init(delegate: SignupCredentialsCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start(usage: SignupCredentialsViewController.Usage) -> UIViewController {
        let interactor = SignupCredentialsInteractor(coordinator: self)
        let viewController = SignupCredentialsViewController(interactor: interactor, usage: usage)
        return viewController
    }

    func didTapNext() {
        delegate.didFinishSignupCredentials()
    }
}

protocol SignupCredentialsCoordinatorDelegate {

    func didFinishSignupCredentials()
}
