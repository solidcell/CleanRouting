import UIKit

class SignupPaymentViewController: UIViewController {

    private let interactor: SignupPaymentInteractor
    private let usage: Usage

    init(interactor: SignupPaymentInteractor, usage: Usage) {
        self.interactor = interactor
        self.usage = usage
        super.init(nibName: nil, bundle: nil)
    }

    enum Usage {
        case presented
        case pushed(nextButton: String)
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

        title = "Signup Payment"

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
        interactor.didTapNext(on: self)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
