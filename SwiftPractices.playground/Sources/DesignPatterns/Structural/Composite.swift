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

@MainActor let joan = Employee(name: "Joan")
@MainActor let tom = Employee(name: "Tom")
@MainActor let cleo = Employee(name: "Cleo")
@MainActor let alex = Employee(name: "Alex")

@MainActor let graphicDesignDepartment = Department(name: "Graphic Design", subunits: [cleo, alex])
@MainActor let marketingDepartment = Department(name: "Marketing", subunits: [joan, tom, graphicDesignDepartment])

marketingDepartment.receive(bonus: 1000)
