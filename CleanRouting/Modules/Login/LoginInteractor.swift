struct LoginInteractor {

    let coordinator: LoginCoordinator

    func didTapLoginButton() {
        UserStore.loggedIn = true
        coordinator.didLogIn()
    }

    func didTapCancelButton() {
        coordinator.didCancelLogIn()
    }
}
