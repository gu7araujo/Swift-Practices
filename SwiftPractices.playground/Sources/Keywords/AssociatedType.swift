protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

struct NameDatabase: ItemStoring {
    var items = [String]()
    
    mutating func add(item: String) {
        //
    }
}

struct ValueDatabase: ItemStoring {
    var items = [Double]()
    
    mutating func add(item: Double) {
        //
    }
}
