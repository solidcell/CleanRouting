struct MenuInteractor {

    let coordinator: MenuCoordinator

    func didTapClose() {
        coordinator.didTapClose()
    }

    func didTapLogOut() {
        UserStore.loggedIn = false
        coordinator.didTapLogOut()
    }

    func didTapLogIn() {
        coordinator.didTapLogIn()
    }

    func didTapSignUp() {
        coordinator.didTapSignUp()
    }
}
