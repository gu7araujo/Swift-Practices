protocol LoggerStrategy {
    func log(_ message: String)
}

struct Logger {
    let strategy: LoggerStrategy

    func log(_ message: String) {
        strategy.log(message)
    }
}

struct LowercaseStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.lowercased())
    }
}

struct UppercaseStratgy: LoggerStrategy {
    func log(_ message: String) {
        print(message.uppercased())
    }
}

struct CapitalizedStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.capitalized)
    }
}

var logger = Logger(strategy: CapitalizedStrategy())
logger.log("my first strategy")

logger = Logger(strategy: UppercaseStrategy())
logger.log("my first strategy")

logger = Logger(strategy: LowercaseStrategy())
logger.log("my first strategy")
