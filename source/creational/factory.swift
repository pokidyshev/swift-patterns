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
