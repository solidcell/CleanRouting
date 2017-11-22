import UIKit

class LoginViewController: ActionListViewController {

    private let interactor: LoginInteractor

    init(interactor: LoginInteractor) {
        self.interactor = interactor
        let actions = [
            Action(name: "Simulate Successful Login", selector: #selector(didTapSuccessButton)),
            Action(name: "Cancel", selector: #selector(didTapCancelButton))
        ]
        super.init(header: "Login", actions: actions)
    }

    @objc private func didTapCancelButton() {
        interactor.didTapCancelButton()
    }

    @objc private func didTapSuccessButton() {
        interactor.didTapLoginButton()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
