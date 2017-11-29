import UIKit

class SignupPaymentViewController: ActionListViewController {

    private let coordinator: SignupPaymentCoordinator
    private let usage: Usage
    private static let titleText = "Signup Payment"

    init(coordinator: SignupPaymentCoordinator, usage: Usage) {
        self.coordinator = coordinator
        self.usage = usage
        let actions = [
            Action(name: "Next", selector: #selector(didTapNext))
        ]
        super.init(header: SignupPaymentViewController.titleText, actions: actions)
    }

    enum Usage {
        case presented
        case pushed(nextButton: String)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        switch usage {
        case .presented:
            break
        case .pushed(nextButton: let nextButton):
            title = SignupPaymentViewController.titleText
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: nextButton,
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(didTapNext))
        }
    }

    @objc private func didTapNext() {
        coordinator.didTapNext(on: self)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
