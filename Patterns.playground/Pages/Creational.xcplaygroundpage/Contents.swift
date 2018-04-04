//: [Behavioral](Behavioral) |
//: Creational |
//: [Structural](Structural)
/*:
Creational
==========
 In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. The basic form of object creation could result in design problems or in added complexity to the design. Creational design patterns solve this problem by somehow controlling this object creation.
 
 [Wiki](https://en.wikipedia.org/wiki/Creational_pattern)
*/
import Swift
import Foundation
/*:
Abstract Factory
-------------------

The abstract factory pattern is used to provide a client with a set of related or dependant objects. 
The "family" of objects created by the factory are determined at run-time.
[Wiki](https://en.wikipedia.org/wiki/Abstract_factory_pattern)
 
### Example
*/
// Abstract classes
protocol RecordBook {
    func getMarks() -> String
}
protocol Girlfriend {
    func cookMeal() -> String
}
protocol Physique {
    func bicepsSize() -> String
}


// Abstract Factory
protocol PersonFactory {
    func makeRecordBook() -> RecordBook
    func makeGirlfriend() -> Girlfriend
    func makePhysique() -> Physique
}

// Concrete classes 1
class YourRecordBook: RecordBook {
    func getMarks() -> String {
        return "3 3 3"
    }
}
class YourGirlfriend: Girlfriend {
    func cookMeal() -> String {
        return "Mediocre meal"
    }
}
class YourPhysique: Physique {
    func bicepsSize() -> String {
        return "0"
    }
}

// Concrete Factory 1
class YourFactory: PersonFactory {
    func makeRecordBook() -> RecordBook {
        return YourRecordBook()
    }
    
    func makeGirlfriend() -> Girlfriend {
        return YourGirlfriend()
    }
    
    func makePhysique() -> Physique {
        return YourPhysique()
    }
}

// Concrete classes 2
class MothersFriendSonsRecordBook: RecordBook {
    func getMarks() -> String {
        return "5 5 5"
    }
}
class MothersFriendSonsGirlfriend: Girlfriend {
    func cookMeal() -> String {
        return "Perfect meal"
    }
}
class MothersFriendSonsPhysique: Physique {
    func bicepsSize() -> String {
        return "9999"
    }
}

// Concrete Factory 2
class MothersFriendSonsFactory: PersonFactory {
    func makeRecordBook() -> RecordBook {
        return MothersFriendSonsRecordBook()
    }
    
    func makeGirlfriend() -> Girlfriend {
        return MothersFriendSonsGirlfriend()
    }
    
    func makePhysique() -> Physique {
        return MothersFriendSonsPhysique()
    }
}
/*:
Factory Method
-----------------

The factory pattern is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.
[Wiki](https://en.wikipedia.org/wiki/Factory_method_pattern)
### Example
*/
protocol Currency {
    func code() -> String
}

class Euro : Currency {
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar : Currency {
    func code() -> String {
        return "USD"
    }
}

protocol CurrencyConverter {
    func getTargetCurrency() -> Currency
}

extension CurrencyConverter {
    func convert(from: Currency) {
        let target = getTargetCurrency()
        print("From \(from.code()) to \(target.code())")
    }
}



class EuroConverter: CurrencyConverter {
    func getTargetCurrency() -> Currency {
        return Euro()
    }
}

class DollarConverter: CurrencyConverter {
    func getTargetCurrency() -> Currency {
        return UnitedStatesDolar()
    }
}
/*:
### Usage
*/
let c = DollarConverter()
c.convert(from: Euro())
/*:
Singleton
------------

The singleton pattern ensures that only one object of a particular class is ever created.
All further references to objects of the singleton class refer to the same underlying instance.
[Wiki](https://en.wikipedia.org/wiki/Singleton_pattern)
 
### Example:
*/
class DeathStarSuperlaser {
    static let sharedInstance = DeathStarSuperlaser()

    private init() {
        // Private initialization to ensure just one instance is created.
    }
}
/*:
### Usage:
*/
let laser = DeathStarSuperlaser.sharedInstance
/*:
 ### Tests:
 */
let another_laser = DeathStarSuperlaser.sharedInstance
if laser === another_laser {
    print("OK")
} else {
    print("FAIL")
}
