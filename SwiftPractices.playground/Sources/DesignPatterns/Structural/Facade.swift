class Subsystem1 {
    func doSomething1() { }
}

class Subsystem2 {
    func doSomething2() { }
}

class Facade {
    private let subsystem1: Subsystem1
    private let subsystem2: Subsystem2

    init(subsystem1: Subsystem1, subsystem2: Subsystem2) {
        self.subsystem1 = subsystem1
        self.subsystem2 = subsystem2
    }

    func doSomething() {
        subsystem1.doSomething1()
        subsystem2.doSomething2()
    }
}

class Client2 {
    init() {
        let subsystem1Impl = Subsystem1()
        let subsystem2Impl = Subsystem2()
        
        let facade = Facade(subsystem1: subsystem1Impl, subsystem2: subsystem2Impl)
        facade.doSomething()
    }
}
