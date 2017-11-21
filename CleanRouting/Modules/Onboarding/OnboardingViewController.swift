import UIKit

class OnboardingViewController: UIViewController {

    private let interactor: OnboardingInteractor

    init(interactor: OnboardingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .randomGray

        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.text = "Onboarding"
        titleLabel.textColor = .black

        let logInButton = UIButton(type: .system)
        view.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 100).isActive = true
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInButton.setTitle("Log In", for: .normal)
        logInButton.addTarget(self, action: #selector(didTapLogIn), for: .touchUpInside)

        let signUpButton = UIButton(type: .system)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: logInButton.topAnchor, constant: 44).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)

        let skipToMap = UIButton(type: .system)
        view.addSubview(skipToMap)
        skipToMap.translatesAutoresizingMaskIntoConstraints = false
        skipToMap.topAnchor.constraint(equalTo: signUpButton.topAnchor, constant: 44).isActive = true
        skipToMap.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skipToMap.setTitle("Skip to Map", for: .normal)
        skipToMap.addTarget(self, action: #selector(didTapSkipToMap), for: .touchUpInside)
    }

    @objc private func didTapLogIn() {
        interactor.didTapLogIn()
    }

    @objc private func didTapSignUp() {
        interactor.didTapSignUp()
    }

    @objc private func didTapSkipToMap() {
        interactor.didTapSkipToMap()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
