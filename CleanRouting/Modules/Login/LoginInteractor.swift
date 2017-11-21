struct LoginInteractor {

    let coordinator: LoginCoordinator

    func didTapLoginButton() {
        coordinator.didLogIn()
    }

    func didTapCancelButton() {
        coordinator.didCancelLogIn()
    }
}
