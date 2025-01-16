struct MyNiceObjectT {
    let text: String
}

class Client7 {
    init() {
        let instanceDirect = MyNiceObjectT(text: "test") // direct constructor call
        let instanceFromFactoryMethod = myObjectFactoryMethod() // instead of using a direct constructor call
    }
    
    func myObjectFactoryMethod() -> MyNiceObjectT {
        MyNiceObjectT(text: "test")
    }
}
