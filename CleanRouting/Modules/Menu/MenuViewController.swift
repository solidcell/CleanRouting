import UIKit

class MenuViewController: ActionListViewController {

    let interactor: MenuInteractor

    init(interactor: MenuInteractor, loggedIn: Bool) {
        self.interactor = interactor
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
        interactor.didTapClose()
    }

    @objc func didTapLogOut() {
        interactor.didTapLogOut()
    }

    @objc func didTapLogIn() {
        interactor.didTapLogIn()
    }

    @objc func didTapSignUp() {
        interactor.didTapSignUp()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
