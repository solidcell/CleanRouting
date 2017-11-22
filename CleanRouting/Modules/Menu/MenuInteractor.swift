struct MenuInteractor {

    let coordinator: MenuCoordinator

    func didTapClose() {
        coordinator.didTapClose()
    }
}
