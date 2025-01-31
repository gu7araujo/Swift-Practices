import UIKit

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

struct Email {
    let wrappedString: String
    
    init?(_ rawString: String) {
        guard rawString.matches("##regex##") else { return nil }
        wrappedString = rawString
    }
}

struct Password {
    let wrappedString: String
    
    init?(_ rawString: String) {
        guard rawString.count >= 8 else { return nil }
        wrappedString = rawString
    }
}

struct AnonymousUser {
    let userID: String
}

struct SignedInUser: Decodable {
    let userID: String
    let username: String
    let sessionToken: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userID = try container.decode(String.self, forKey: .userID)
        username = try container.decode(String.self, forKey: .username)
        sessionToken = try container.decode(String.self, forKey: .sessionToken)
    } // Rule: Only way to get this object it's from API
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username = "username"
        case sessionToken = "session_token"
    }
}

enum User {
    case anonymous(AnonymousUser)
    case signedIn(SignedInUser)
}

class client12 {
    var user: User = .anonymous(AnonymousUser(userID: "#random_string#"))
    //user = .signedIn(SignedInUser(from: ???))
}

typealias SignInFunctionReturn = Result<SignedInUser, Error> // Rule: Known why request failed

class MainScreenViewController: UIViewController {
    init(_: SignedInUser) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension client12 {
    @MainActor func showMainScreen(_ user: SignedInUser) { // Rule: Only show main screen when user signed, explicit dependency following the requirements
        let _ = MainScreenViewController(user) // Rule: Only open main screen when user signed
    //    navigationController.push(vc)
    }

    func showErrorMessage(error: Error) { }
}

struct NonEmpty<Element> {
    let head: Element
    let tail: [Element]
    
    init(head: Element, tail: [Element] = []) {
        self.head = head
        self.tail = tail
    }
    
    init?(_ elements: [Element]) {
        guard let first = elements.first else { return nil }
        self.head = first
        self.tail = Array(elements.dropFirst())
    }
}
