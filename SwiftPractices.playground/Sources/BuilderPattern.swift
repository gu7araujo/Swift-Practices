//
//  BuilderPattern.swift
//
//
//  Created by Gustavo Araujo Santos on 12/10/24.
//

struct MyObject {
    private(set) var name: String = String()
    private(set) var description: String = String()
    private(set) var value: Int = Int()
    
    private init() {
        // Intentionally not implemented
    }
}

extension MyObject {
    
    public static func builder() -> Builder {
        Builder()
    }
    
    final class Builder {
        private var model = MyObject()
        
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
        
        func build() -> MyObject {
            model
        }
    }
}

let object = MyObject.builder()
    .with(name: "Gustavo")
    .with(description: "Hello")
    .with(value: 1)
    .build()
