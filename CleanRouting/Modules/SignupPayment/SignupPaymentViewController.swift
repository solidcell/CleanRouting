import UIKit

class SignupPaymentViewController: ActionListViewController {

    private let interactor: SignupPaymentInteractor
    private let usage: Usage
    private static let titleText = "Signup Payment"

    init(interactor: SignupPaymentInteractor, usage: Usage) {
        self.interactor = interactor
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
        interactor.didTapNext(on: self)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
