import UIKit

class OnboardingCoordinator: LoginCoordinatorDelegate, SignupCoordinatorDelegate {

    private let delegate: OnboardingCoordinatorDelegate
    private weak var viewController: UIViewController?

    init(delegate: OnboardingCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let interactor = OnboardingInteractor(coordinator: self)
        let viewController = OnboardingViewController(interactor: interactor)
        self.viewController = viewController
        return viewController
    }

    func didTapLogIn() {
        let loginViewController = LoginCoordinator(delegate: self).start()
        viewController?.present(loginViewController, animated: true)
    }

    func didTapSignUp() {
        let signupViewController = SignupCoordinator(delegate: self).start()
        viewController?.present(signupViewController, animated: true)
    }

    func didTapSkipToMap() {
        delegate.didTapSkipToMapInOnboarding()
    }

    func didLogIn() {
        delegate.didLogInInOnboarding()
    }

    func didCancelLogIn() {
        viewController?.dismiss(animated: true)
    }

    func didFinishSignup() {
        delegate.didSignUpInOnboarding()
    }
}

protocol OnboardingCoordinatorDelegate {

    func didTapSkipToMapInOnboarding()
    func didLogInInOnboarding()
    func didSignUpInOnboarding()
}
