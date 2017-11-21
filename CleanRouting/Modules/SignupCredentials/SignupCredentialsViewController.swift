import UIKit

class SignupCredentialsViewController: UIViewController {

    private let interactor: SignupCredentialsInteractor
    private let usage: Usage

    enum Usage {
        case presented
        case pushed(nextButton: String)
    }

    init(interactor: SignupCredentialsInteractor, usage: Usage) {
        self.interactor = interactor
        self.usage = usage
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        switch usage {
        case .presented:
            break
        case .pushed(nextButton: let nextButton):
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: nextButton,
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(didTapNext))
        }

        title = "Signup Credentials"

        view.backgroundColor = .randomGray

        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.textColor = .black
        titleLabel.text = title

        let nextButton = UIButton(type: .system)
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    }

    @objc private func didTapNext() {
        interactor.didTapNext()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
