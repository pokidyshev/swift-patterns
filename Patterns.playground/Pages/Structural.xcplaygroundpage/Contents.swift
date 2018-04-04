//: [Behavioral](Behavioral) |
//: [Creational](Creational) |
//: Structural
/*:
Structural
==========
 In software engineering, structural design patterns are design patterns that ease the design by identifying a simple way to realize relationships between entities.
[Wiki](https://en.wikipedia.org/wiki/Structural_pattern)
*/
import Swift
import Foundation
/*:
Adapter
----------

The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the "adaptee" with a class that supports the interface required by the client.
[Wiki](https://en.wikipedia.org/wiki/Adapter_pattern)
 
### Example
*/
protocol OlderDeathStarSuperLaserAiming {
    var angleV: NSNumber {get}
    var angleH: NSNumber {get}
}
/*:
**Adaptee**
*/
struct DeathStarSuperlaserTarget {
    let angleHorizontal: Double
    let angleVertical: Double

    init(angleHorizontal:Double, angleVertical:Double) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}
/*:
**Adapter**
*/
struct OldDeathStarSuperlaserTarget : OlderDeathStarSuperLaserAiming {
    private let target : DeathStarSuperlaserTarget

    var angleV:NSNumber {
        return NSNumber(value: target.angleVertical)
    }

    var angleH:NSNumber {
        return NSNumber(value: target.angleHorizontal)
    }

    init(_ target:DeathStarSuperlaserTarget) {
        self.target = target
    }
}
/*:
### Usage
*/
let target = DeathStarSuperlaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
let oldFormat = OldDeathStarSuperlaserTarget(target)

oldFormat.angleH
oldFormat.angleV
/*:
Decorator
------------

The decorator pattern is used to extend or alter the functionality of objects at run- time by wrapping them in an object of a decorator class. 
This provides a flexible alternative to using inheritance to modify behaviour.
[Wiki](https://en.wikipedia.org/wiki/Decorator_pattern)

### Example
*/
protocol Coffee {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCoffee: Coffee {
    func getCost() -> Double {
        return 1.0
    }

    func getIngredients() -> String {
        return "Coffee"
    }
}

class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee
    fileprivate let ingredientSeparator: String = ", "

    required init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }

    func getCost() -> Double {
        return decoratedCoffee.getCost()
    }

    func getIngredients() -> String {
        return decoratedCoffee.getIngredients()
    }
}

final class Milk: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Double {
        return super.getCost() + 0.5
    }

    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Milk"
    }
}

final class WhipCoffee: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Double {
        return super.getCost() + 0.7
    }

    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Whip"
    }
}
/*:
### Usage:
*/
var someCoffee: Coffee = SimpleCoffee()
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = Milk(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = WhipCoffee(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
/*:
Facade
---------

The facade pattern is used to define a simplified interface to a more complex subsystem.
[Wiki](https://en.wikipedia.org/wiki/Facade_pattern)

### Example
*/
enum Eternal {

    static func set(_ object: Any, forKey defaultName: String) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(object, forKey:defaultName)
        defaults.synchronize()
    }

    static func object(forKey key: String) -> AnyObject! {
        let defaults: UserDefaults = UserDefaults.standard
        return defaults.object(forKey: key) as AnyObject?
    }

}
/*:
### Usage
*/
Eternal.set("Disconnect me.", forKey:"Bishop")
Eternal.object(forKey: "Bishop")
/*:
Protection Proxy
------------------

The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object. 
Protection proxy is restricting access.
[Wiki](https://en.wikipedia.org/wiki/Proxy_pattern)
 
### Example
*/
protocol DoorOperator {
    func open(doors: String) -> String
}

class HAL9000 : DoorOperator {
    func open(doors: String) -> String {
        return ("HAL9000: Affirmative, Dave. I read you. Opened \(doors).")
    }
}

class CurrentComputer : DoorOperator {
    private var computer: HAL9000!

    func authenticate(password: String) -> Bool {

        guard password == "pass" else {
            return false;
        }

        computer = HAL9000()

        return true
    }

    func open(doors: String) -> String {

        guard computer != nil else {
            return "Access Denied. I'm afraid I can't do that."
        }

        return computer.open(doors: doors)
    }
}
/*:
### Usage
*/
let computer = CurrentComputer()
let podBay = "Pod Bay Doors"

computer.open(doors: podBay)

computer.authenticate(password: "pass")
computer.open(doors: podBay)
