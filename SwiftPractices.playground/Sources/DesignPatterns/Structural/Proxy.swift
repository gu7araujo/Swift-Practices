protocol ExampleProtocol {
    func performDesctructiveAction()
}

struct DatabaseService: ExampleProtocol {
    func performDestructiveAction() {
        // Delete all tables 😈
    }
}

struct DatabaseServiceProxy: ExampleProtocol {
    let isAdmin: Bool
    private let service = DatabaseService()
    
    func performDestructiveAction() {
        guard isAdmin else { return }
        service.performDestructiveAction()
    }
}
