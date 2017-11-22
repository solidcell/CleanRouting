import UIKit

class OnboardingViewController: ActionListViewController {

    private let interactor: OnboardingInteractor

    init(interactor: OnboardingInteractor) {
        self.interactor = interactor
        let actions = [
            Action(name: "Log In", selector: #selector(didTapLogIn)),
            Action(name: "Sign Up", selector: #selector(didTapSignUp)),
            Action(name: "Skip To Map", selector: #selector(didTapSkipToMap))
        ]
        super.init(header: "Onboarding", actions: actions)
    }

    @objc func didTapLogIn() {
        interactor.didTapLogIn()
    }

    @objc func didTapSignUp() {
        interactor.didTapSignUp()
    }

    @objc func didTapSkipToMap() {
        interactor.didTapSkipToMap()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

