import Foundation

// https://nalexn.github.io/kvo-guide-for-key-value-observing/
// https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift

/// Type need to inherit from `NSObject` to utilize `NSKeyValueObserving` protocol
final class Foo: NSObject {
    @objc dynamic var bar: Int = 0 // property have to be exposed to objc runtime and be observable
}

let foo = Foo()

var observation: NSKeyValueObservation? = nil // token holding observation while its not nil
observation = foo.observe(\.bar, options: NSKeyValueObservingOptions.new) { (foo, value: NSKeyValueObservedChange<Int>) in
    print("Observer got new value \(String(describing: value.newValue))")
}

foo.bar = 0
foo.bar = 1

observation?.invalidate()
