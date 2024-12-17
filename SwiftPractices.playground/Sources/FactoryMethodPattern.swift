struct MyObject {
    let text: String
}

func myObjectFactoryMethod() -> MyObject {
    MyObject(text: "test")
}

let instanceDirect = MyObject(text: "test") // direct constructor call
let instanceFromFactoryMethod = myObjectFactoryMethod() // instead of using a direct constructor call
