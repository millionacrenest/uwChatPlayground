//: Playground - noun: a place where people can play

import UIKit
import Foundation

/////// Equatable, Hashable

struct Person: Equatable, Hashable {
    var firstName: String
    var lastName: String
    var age: Int
}

let paul = Person(firstName: "Paul", lastName: "Hudson", age: 38)
let joanne = Person(firstName: "Paul", lastName: "Hudson", age: 38)

if paul == joanne {
    print("These people match")
} else {
    print("No match")
}

paul.hashValue
joanne.hashValue


///////////// Codable key stratagies


struct Mac: Codable {
    var name: String
    var screenSize: Int
    var cpuCount: Int
}


let jsonString = """
[
{
"name": "MacBook Pro",
"screen_size": 15,
"cpu_count": 4
},
{
"name": "iMac Pro",
"screen_size": 27,
"cpu_count": 18
}
]
"""

let jsonData = Data(jsonString.utf8)

let decoder = JSONDecoder()

do {
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let macs = try decoder.decode([Mac].self, from: jsonData)
    print(macs)
} catch {
    print(error.localizedDescription)
}



///////////// Conditional Conformance

protocol ScoreConvertible {
    func computeScore() -> Int
}

struct Level: ScoreConvertible {
    var id: String?
    func computeScore() -> Int {
        return 1
    }
}

extension Array: ScoreConvertible where Element: ScoreConvertible {
    
    func computeScore() -> Int {
        return reduce(0) { result, element in
            result + element.computeScore()
        }
    }
}


let levels = [Level(id: "water-0"), Level(id: "water-1")]
let score = levels.computeScore()

let worlds = [
    [Level(id: "water-0"), Level(id: "water-1")],
    [Level(id: "sand-0"), Level(id: "sand-1")],
    [Level(id: "lava-0"), Level(id: "lava-1")]
]
    
let totalScore = worlds.computeScore()


////////// Recursive Constraints

protocol Employee {
    associatedtype Manager: Employee
    var manager: Manager? { get set }
}

class BoardMember: Employee {
    var manager: BoardMember?
}

class SeniorDeveloper: Employee {
    var manager: BoardMember?
}

class JuniorDeveloper: Employee {
    var manager: SeniorDeveloper?
}



