protocol ExampleProtocol {
    func performDesctructiveAction()
}

struct DatabaseService: ExampleProtocol {
    func performDesctructiveAction() {
        // Delete all tables 😈
    }
}

struct DatabaseServiceProxy: ExampleProtocol {
    let isAdmin: Bool
    private let service = DatabaseService()
    
    func performDesctructiveAction() {
        guard isAdmin else { return }
        service.performDesctructiveAction()
    }
}
