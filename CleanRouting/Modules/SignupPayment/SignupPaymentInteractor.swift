import UIKit

struct SignupPaymentInteractor {

    let coordinator: SignupPaymentCoordinator

    func didTapNext(on viewController: UIViewController) {
        coordinator.didTapNext(on: viewController)
    }
}
