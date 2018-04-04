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


