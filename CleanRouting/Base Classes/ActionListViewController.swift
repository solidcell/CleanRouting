import UIKit

class ActionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let actions: [Action]
    private let header: String

    init(header: String, actions: [Action]) {
        self.header = header
        self.actions = actions
        super.init(nibName: nil, bundle: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = actions[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        perform(actions[indexPath.row].selector)
    }

    private let cellReuseIdentifier = "cell"
    private let tableView = UITableView()

    struct Action {
        let name: String
        let selector: Selector
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        tableView.alwaysBounceVertical = false // disable scrolling unless needed
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        let headerLabel = UILabel()
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 44).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.font = UIFont.systemFont(ofSize: 30)
        headerLabel.text = header
        headerLabel.textColor = .black

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 44).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
