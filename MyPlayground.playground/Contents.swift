//: Playground - noun: a place where people can play

import UIKit

protocol ScoreConvertible {
    func computeScore() -> Int
}

struct Level: ScoreConvertible {
    var id: String?
    func computeScore() -> Int {
        return 1
    }
}

let levels = [Level(id: "water-0"), Level(id: "water-1")]

let worlds = [
    [Level(id: "water-0"), Level(id: "water-1")],
    [Level(id: "sand-0"), Level(id: "sand-1")],
    [Level(id: "lava-0"), Level(id: "lava-1")]
]

let score = worlds.computeScore()


extension Array: ScoreConvertible where Element: ScoreConvertible {
    func computeScore() -> Int {
        return reduce(0) { result, element in
            result + element.computeScore()
        }
    }
}
