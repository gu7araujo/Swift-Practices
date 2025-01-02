protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}

struct ValueDatabase: ItemStoring {
    var items = [Double]()
}
