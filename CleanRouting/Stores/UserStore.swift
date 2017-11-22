import Foundation

struct UserStore {

    private static let userDefaults = UserDefaults.standard
    private static let loggedInKey = "loggedIn"

    static var loggedIn: Bool {
        set { userDefaults.set(newValue, forKey: loggedInKey) }
        get { return userDefaults.bool(forKey: loggedInKey) }
    }
}

