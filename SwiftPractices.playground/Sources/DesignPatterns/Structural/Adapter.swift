// Swift Extension Approach
protocol Jumping {
    func jump()
}

class Dog: Jumping {
    func jump() {
        print("Jumps Excitedly")
    }
}

class Cat: Jumping {
    func jump() {
        print("Pounces")
    }
}

/// The Adaptee
class Frog {
    func leap() {
        print("Leaps")
    }
}

extension Frog: Jumping {
    func jump() {
        leap()
    }
}

/// before
@MainActor var animals: [Jumping] = [Dog(), Cat()]

func jumpAll(animals: [Jumping], frog: Frog? = nil) {
    for animal in animals {
        animal.jump()
    }
    if let frog = frog {
        frog.leap()
    }
}

/// after
animals = [Dog(), Cat(), Frog()]

func jumpAll(animals: [Jumping]) {
    for animal in animals {
        animal.jump()
    }
}

// The Dedicated Adapter Approach
class FrogAdapter: Jumping {
    private let frog: Frog
    
    init(frog: Frog) {
        self.frog = frog
    }
    
    func jump() {
        frog.leap()
    }
}
