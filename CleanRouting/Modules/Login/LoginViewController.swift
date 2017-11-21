import UIKit

class LoginViewController: UIViewController {

    private let interactor: LoginInteractor

    init(interactor: LoginInteractor) {
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
        titleLabel.text = "Login"
        titleLabel.textColor = .black

        let successButton = UIButton(type: .system)
        view.addSubview(successButton)
        successButton.translatesAutoresizingMaskIntoConstraints = false
        successButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 100).isActive = true
        successButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        successButton.setTitle("Simulate Successful Login", for: .normal)
        successButton.addTarget(self, action: #selector(didTapSuccessButton), for: .touchUpInside)

        let cancelButton = UIButton(type: .system)
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: successButton.topAnchor, constant: 44).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }

    @objc private func didTapCancelButton() {
        interactor.didTapCancelButton()
    }

    @objc private func didTapSuccessButton() {
        interactor.didTapLoginButton()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
