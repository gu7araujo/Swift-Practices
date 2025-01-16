protocol Payee {
    var name: String { get }
    var bonusAmount: Double { get }
    func receive(bonus: Double)
}

class Employee: Payee {
    private(set) var name: String
    private(set) var bonusAmount: Double = 0
    
    init(name: String) {
        self.name = name
    }
    
    func receive(bonus: Double) {
        bonusAmount += bonus
    }
}

class Department: Payee {
    private(set) var name: String
    var bonusAmount: Double {
        get {
            var bonus = 0.0
            
            for subunit in subunits {
                bonus += subunit.bonusAmount
            }
            return bonus
        }
        set {
            let splitCount = Double(subunits.count)
            let splitBonus = newValue / splitCount
            for subunit in subunits {
                subunit.receive(bonus: splitBonus)
            }
        }
    }
    
    private let subunits: [Payee]
    
    init(name: String, subunits: [Payee] = []) {
        self.name = name
        self.subunits = subunits
    }
    
    func receive(bonus: Double) {
        bonusAmount += bonus
    }
}

class Client4 {
    init() {
        let joan = Employee(name: "Joan")
        let tom = Employee(name: "Tom")
        let cleo = Employee(name: "Cleo")
        let alex = Employee(name: "Alex")

        let graphicDesignDepartment = Department(name: "Graphic Design", subunits: [cleo, alex])
        let marketingDepartment = Department(name: "Marketing", subunits: [joan, tom, graphicDesignDepartment])

        marketingDepartment.receive(bonus: 1000)
    }
}
