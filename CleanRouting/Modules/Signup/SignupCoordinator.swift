import UIKit

class SignupCoordinator: SignupCredentialsCoordinatorDelegate, SignupPaymentCoordinatorDelegate, ConfirmEmailReminderCoordinatorDelegate {

    private let nextButtonText = "Next"
    private let delegate: SignupCoordinatorDelegate
    private weak var viewController: UINavigationController?

    init(delegate: SignupCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start() -> UIViewController {
        let signupCredentialsViewController = SignupCredentialsCoordinator(delegate: self)
            .start(usage: .pushed(nextButton: nextButtonText))
        let viewController = UINavigationController(rootViewController: signupCredentialsViewController)
        self.viewController = viewController
        return viewController
    }

    func didFinishSignupCredentials() {
        let signupPaymentViewController = SignupPaymentCoordinator(delegate: self)
            .start(usage: .pushed(nextButton: nextButtonText))
        viewController?.pushViewController(signupPaymentViewController, animated: true)
    }

    func didFinishSignupPayment(on paymentViewController: UIViewController) {
        let confirmEmailReminderViewController = ConfirmEmailReminderCoordinator(delegate: self)
            .start()
        paymentViewController.present(confirmEmailReminderViewController, animated: true)
    }

    func didTapEmailReminderOK() {
        delegate.didFinishSignup()
    }
}

protocol SignupCoordinatorDelegate {

    func didFinishSignup()
}
