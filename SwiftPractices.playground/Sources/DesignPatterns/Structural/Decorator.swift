protocol Text {
    func content() -> String
}

// Concrete Component
class PlainText: Text {
    func content() -> String {
        return "This is plain text."
    }
}

// Decorator
protocol TextDecorator: Text {
    var textComponent: Text { get set }
}

// Concrete Decorators
class BoldDecorator: TextDecorator {
    var textComponent: Text
    
    init(_ component: Text) {
        self.textComponent = component
    }
    
    func content() -> String {
        return "<b>\(textComponent.content())</b>"
    }
}

class ItalicDecorator: TextDecorator {
    var textComponent: Text
    
    init(_ component: Text) {
        self.textComponent = component
    }
    
    func content() -> String {
        return "<i>\(textComponent.content())</i>"
    }
}

// Usage

class Client3 {
    init() {
        let plainText = PlainText()
        let formattedText = BoldDecorator(ItalicDecorator(plainText))
        
        print(formattedText.content())
    }
}
