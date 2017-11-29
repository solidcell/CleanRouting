import UIKit

class MenuViewController: ActionListViewController {

    private let coordinator: MenuCoordinator

    init(coordinator: MenuCoordinator, loggedIn: Bool) {
        self.coordinator = coordinator
        let loggedInStateActions = loggedIn
            ? [Action(name: "Log Out", selector: #selector(didTapLogOut))]
            : [
                Action(name: "Log In", selector: #selector(didTapLogIn)),
                Action(name: "Sign Up", selector: #selector(didTapSignUp))
              ]
        let actions = [
            Action(name: "Close", selector: #selector(didTapClose))
        ] + loggedInStateActions
        super.init(header: "Menu", actions: actions)
    }

    @objc func didTapClose() {
        coordinator.didTapClose()
    }

    @objc func didTapLogOut() {
        UserStore.loggedIn = false
        coordinator.didLogOut()
    }

    @objc func didTapLogIn() {
        coordinator.didTapLogIn()
    }

    @objc func didTapSignUp() {
        coordinator.didTapSignUp()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
