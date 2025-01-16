struct MyNiceObject2 {
    private(set) var name: String = String()
    private(set) var description: String = String()
    private(set) var value: Int = Int()
    
    private init() {
        // Intentionally not implemented
    }
}

extension MyNiceObject2 {
    
    public static func builder() -> Builder {
        Builder()
    }
    
    final class Builder {
        private var model = MyNiceObject2()
        
        func with(name: String) -> Builder {
            model.name = name
            return self
        }
        
        func with(description: String) -> Builder {
            model.description = description
            return self
        }
        
        func with(value: Int) -> Builder {
            model.value = value
            return self
        }
        
        func build() -> MyNiceObject2 {
            model
        }
    }
}

class client8 {
    let object = MyNiceObject2.builder()
        .with(name: "Gustavo")
        .with(description: "Hello")
        .with(value: 1)
        .build()
}
