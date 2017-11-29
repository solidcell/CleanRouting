import UIKit

class OnboardingViewController: ActionListViewController {

    private let coordinator: OnboardingCoordinator

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        let actions = [
            Action(name: "Log In", selector: #selector(didTapLogIn)),
            Action(name: "Sign Up", selector: #selector(didTapSignUp)),
            Action(name: "Skip To Map", selector: #selector(didTapSkipToMap))
        ]
        super.init(header: "Onboarding", actions: actions)
    }

    @objc func didTapLogIn() {
        coordinator.didTapLogIn()
    }

    @objc func didTapSignUp() {
        coordinator.didTapSignUp()
    }

    @objc func didTapSkipToMap() {
        coordinator.didTapSkipToMap()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

