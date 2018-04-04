//: Behavioral |
//: [Creational](Creational) |
//: [Structural](Structural)
/*:
Behavioral
==========
In software engineering, behavioral design patterns are design patterns that identify common communication patterns between objects and realize these patterns. By doing so, these patterns increase flexibility in carrying out this communication.
[Wiki](https://en.wikipedia.org/wiki/Behavioral_pattern)
*/
import Swift
import Foundation
/*:
Iterator
-----------

The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.
[Wiki](https://en.wikipedia.org/wiki/Iterator_pattern)
 
### Example:
*/
struct Novella {
    let name: String
}

struct Novellas {
    let novellas: [Novella]
}

struct NovellasIterator: IteratorProtocol {

    private var current = 0
    private let novellas: [Novella]

    init(novellas: [Novella]) {
        self.novellas = novellas
    }

    mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}
/*:
### Usage
*/
let greatNovellas = Novellas(novellas: [Novella(name: "The Mist")] )

for novella in greatNovellas {
    print("I've read: \(novella)")
}
/*:
Observer
-----------

The observer pattern is used to allow an object to publish changes to its state.
Other objects subscribe to be immediately notified of any changes.
[Wiki](https://en.wikipedia.org/wiki/Observer_pattern)
 
### Example
*/
protocol PropertyObserver : class {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class TestChambers {
    
    var observers: [PropertyObserver] = []
    
    private let testChamberNumberName = "testChamberNumber"
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            for observer in observers {
                observer.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
            }
        }
        didSet {
            for observer in observers {
                observer.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
            }
        }
    }
}


final class Observer : PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if let nw =  newPropertyValue as? Int {
            print("Will change '\(propertyName)' to \(nw)")
        }
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if let ow = oldPropertyValue as? Int {
            print("Did change '\(propertyName)' from \(ow)")
        }
    }
}

final class AnotherObserver : PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        print("Wooohooo")
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        print("Yaaaaay")
    }
}
/*:
### Usage
*/
var testChambers = TestChambers()
testChambers.observers.append(Observer())
testChambers.observers.append(AnotherObserver())
testChambers.testChamberNumber += 1


