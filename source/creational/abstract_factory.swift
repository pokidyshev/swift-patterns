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
