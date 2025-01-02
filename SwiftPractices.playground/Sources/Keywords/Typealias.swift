typealias Dollar = Double

struct Receipt {
    let totalCosts: Dollar
}

typealias Completion = () -> Void
typealias TransitionDelegate = UIViewController & UIViewControllerTransitioningDelegate
