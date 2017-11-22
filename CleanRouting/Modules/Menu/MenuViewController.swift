import UIKit

class MenuViewController: ActionListViewController {

    let interactor: MenuInteractor

    init(interactor: MenuInteractor, loggedIn: Bool) {
        self.interactor = interactor
        let logInOrLogOutAction = loggedIn
            ? Action(name: "Log Out", selector: #selector(didTapLogOut))
            : Action(name: "Log In", selector: #selector(didTapLogIn))
        let actions = [
            logInOrLogOutAction,
            Action(name: "Close", selector: #selector(didTapClose))
        ]
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

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
