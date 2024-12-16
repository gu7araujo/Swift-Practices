/// Abstract factory for UI components
protocol UIFactory {
    func createButton() -> UIButton
    func createTextField() -> UITextField
}

/// Concrete factory for iOS
struct iOSFactory: @preconcurrency UIFactory {
    @MainActor func createButton() -> UIButton {
        return UIButton()
    }
    
    @MainActor func createTextField() -> UITextField {
        return UITextField()
    }
}

/// Concrete factory for MacOS
struct MacFactory: @preconcurrency UIFactory {
    @MainActor func createButton() -> UIButton {
        return UIButton()
    }
    
    @MainActor func createTextField() -> UITextField {
        return UITextField()
    }
}

/// Concrete factory for iPad
struct iPadFactory: @preconcurrency UIFactory {
    @MainActor func createButton() -> UIButton {
        return UIButton()
    }
    
    @MainActor func createTextField() -> UITextField {
        return UITextField()
    }
}

struct ClientCode {
    let factoryType: UIFactory
    
    func createUI() -> UIView {
        factoryType.createButton()
    }
}

#if iOS
    let clientCode = ClientCode(factoryType: iOSFactory())
#elseif MacOS
    let clientCode = ClientCode(factoryType: MacFactory())
#else
    let clientCode = ClientCode(factoryType: iPadFactory())
#endif
