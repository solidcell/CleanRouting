struct SignupCredentialsInteractor {

    let coordinator: SignupCredentialsCoordinator

    func didTapNext() {
        UserStore.loggedIn = true
        coordinator.didTapNext()
    }
}
