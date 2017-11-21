import UIKit

class SignupPaymentCoordinator {

    private let delegate: SignupPaymentCoordinatorDelegate

    init(delegate: SignupPaymentCoordinatorDelegate) {
        self.delegate = delegate
    }

    func start(usage: SignupPaymentViewController.Usage) -> UIViewController {
        let interactor = SignupPaymentInteractor(coordinator: self)
        let viewController = SignupPaymentViewController(interactor: interactor, usage: usage)
        return viewController
    }

    func didTapNext(on viewController: UIViewController) {
        delegate.didFinishSignupPayment(on: viewController)
    }
}

protocol SignupPaymentCoordinatorDelegate {

    func didFinishSignupPayment(on: UIViewController)
}
