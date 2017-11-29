import UIKit

class SignupPaymentCoordinator {

    private let delegate: SignupPaymentCoordinatorDelegate

    init(delegate: SignupPaymentCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start(usage: SignupPaymentViewController.Usage) -> UIViewController {
        let viewController = SignupPaymentViewController(coordinator: self, usage: usage)
        return viewController
    }

    func didTapNext(on viewController: UIViewController) {
        delegate.didFinishSignupPayment(on: viewController)
    }
}

protocol SignupPaymentCoordinatorDelegate {

    func didFinishSignupPayment(on: UIViewController)
}
