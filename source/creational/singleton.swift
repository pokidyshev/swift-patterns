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
