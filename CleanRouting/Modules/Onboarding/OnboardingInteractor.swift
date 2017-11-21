struct OnboardingInteractor {

    let coordinator: OnboardingCoordinator

    func didTapLogIn() {
        coordinator.didTapLogIn()
    }

    func didTapSignUp() {
        coordinator.didTapSignUp()
    }

    func didTapSkipToMap() {
        coordinator.didTapSkipToMap()
    }
}
