import UIKit

class MapViewController: ActionListViewController {

    private let coordinator: MapCoordinator

    init(coordinator: MapCoordinator) {
        self.coordinator = coordinator
        let actions = [
            Action(name: "Menu", selector: #selector(didTapMenu))
        ]
        super.init(header: "Map", actions: actions)
    }

    @objc func didTapMenu() {
        coordinator.didTapMenu()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
