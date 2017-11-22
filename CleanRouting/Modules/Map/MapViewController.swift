import UIKit

class MapViewController: ActionListViewController {

    let interactor: MapInteractor

    init(interactor: MapInteractor) {
        self.interactor = interactor
        let actions = [
            Action(name: "Menu", selector: #selector(didTapMenu))
        ]
        super.init(header: "Map", actions: actions)
    }

    @objc func didTapMenu() {
        interactor.didTapMenu()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
