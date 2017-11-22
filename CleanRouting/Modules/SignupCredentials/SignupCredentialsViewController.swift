import UIKit

class SignupCredentialsViewController: ActionListViewController {

    private let usage: Usage
    private let interactor: SignupCredentialsInteractor
    private static let titleText = "Signup Credentials"

    enum Usage {
        case presented
        case pushed(nextButton: String)
    }

    init(interactor: SignupCredentialsInteractor, usage: Usage) {
        self.interactor = interactor
        self.usage = usage
        let actions = [
            Action(name: "Next", selector: #selector(didTapNext))
        ]
        super.init(header: SignupCredentialsViewController.titleText, actions: actions)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        switch usage {
        case .presented:
            break
        case .pushed(nextButton: let nextButton):
            self.title = SignupCredentialsViewController.titleText
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: nextButton,
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(didTapNext))
        }
    }

    @objc private func didTapNext() {
        interactor.didTapNext()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
