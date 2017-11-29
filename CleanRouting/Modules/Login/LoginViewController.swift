import UIKit

class LoginViewController: ActionListViewController {

    private let coordinator: LoginCoordinator

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        let actions = [
            Action(name: "Simulate Successful Login", selector: #selector(didTapSuccessButton)),
            Action(name: "Cancel", selector: #selector(didTapCancelButton))
        ]
        super.init(header: "Login", actions: actions)
    }

    @objc private func didTapCancelButton() {
        coordinator.didCancelLogIn()
    }

    @objc private func didTapSuccessButton() {
        UserStore.loggedIn = true
        coordinator.didLogIn()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
