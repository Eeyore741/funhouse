//https://dispatchswift.com/type-constraints-for-generics-in-swift-d6bf2f0dbbb2
//http://austinzheng.com/2015/01/02/swift-generics-pt-1
//https://stackoverflow.com/questions/27965439/cannot-explicitly-specialize-a-generic-function
//https://medium.com/flawless-app-stories/mastering-swift-protocols-7cf677860160
//https://www.swiftbysundell.com/articles/different-categories-of-swift-protocols
//https://www.toptal.com/swift/introduction-protocol-oriented-programming-swift

import Foundation

/// Baisc generic in type definition
final class Foo0<Bar0> {
    
    func test() {
        print(Bar0.self)
    }
}
let foo0 = Foo0<Double>()
foo0.test()

///

private extension Foo0 {
    
    /// Test generic in function
    /// - Parameter bar: Passing attribute of generic type
    func testG<Bar1>(_ bar: Bar1) {
        print(Bar1.self)
    }
}
foo0.testG(1.0)

///

protocol FooProtocol {
    associatedtype BarType
    func descr(_ it: BarType)
}

extension Foo0: FooProtocol {
    
    typealias BarType = String
    
    func descr(_ it: String) {
        print(it)
    }
}

extension FooProtocol where BarType == Double {
    
    func sumBars(_ bars: [BarType]) -> BarType {
        bars.reduce(0.0) { (result: Double, next: Double) -> Double in result + next }
    }
}

final class Foo1 { }
extension Foo1: FooProtocol {
    typealias BarType = Double
    
    func descr(_ it: Double) { }
}

let foo1 = Foo1()
foo1.sumBars([1, 2, 3])

/// Basic protocol can be used as type in collections
protocol BasicProtocol { }
let basicArrayOfProtocolConformingInstances = [BasicProtocol]()

/// Protocol with associated type can not be used as standalone type
protocol BasicProtocolWithAT { associatedtype AT }
//let arrayWithProtocolWithAT = [BasicProtocolWithAT]()

/// Basic class with generic can be only used with generic defined
class ClassWithGeneric<GenericType> { }
let arrayOfClassWithGeneric = [ClassWithGeneric<String>]()

/// Passing new generic of `InheretingGenericClass` into `BasicClassWithGeneric` inhereting from
class InheretingGenericClass<GT>: ClassWithGeneric<GT> { }

