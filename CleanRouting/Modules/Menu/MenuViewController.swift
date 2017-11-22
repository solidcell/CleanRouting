import UIKit

class MenuViewController: ActionListViewController {

    let interactor: MenuInteractor

    init(interactor: MenuInteractor) {
        self.interactor = interactor
        let actions = [
            Action(name: "Close", selector: #selector(didTapClose))
        ]
        super.init(header: "Menu", actions: actions)
    }

    @objc func didTapClose() {
        interactor.didTapClose()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
