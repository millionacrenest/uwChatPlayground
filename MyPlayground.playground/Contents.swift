//: Playground - noun: a place where people can play

import UIKit
import Foundation



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


/////////////

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
    




//////////

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


