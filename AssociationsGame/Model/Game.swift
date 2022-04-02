//
//  Game.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import Foundation

struct Game {
    let playerName: String
    let difficulty: Difficulty
    var livesLeft: Int
    let levels: [Level]
    var score: Int
    
    var levelIndex: Int
    var levelCounter: Int
    
    init(playerName: String, difficulty: Difficulty, associations: [String : [String : Int]]) {
        self.playerName = playerName
        self.difficulty = difficulty
        self.livesLeft = difficulty.lives
        self.levels = associations.map { Level(word: $0.key, associations: $0.value) }
        self.score = 0
        self.levelIndex = 0
        self.levelCounter = 1
    }
    
    mutating func moveToNextLevel() {
        if levels.count < (levelCounter + 1) {
            self.levelIndex += 1
            self.levelCounter += 1
        } else {
            print("ERROR! moveToNextLevel failed")
        }
    }
    
    func getAnswerWord() -> String {
        return levels[levelIndex].word
    }
    
    func getAssociations() -> [String] {
        return levels[levelIndex].associations
    }
}

enum Difficulty: Int {
    case easy
    case normal
    case hard
    
    var lives: Int {
        switch self {
        case .easy:   return 7
        case .normal: return 5
        case .hard:   return 3
        }
    }
}

struct Level {
    let word: String
    let associations: [String]
    
    init(word: String, associations: [String : Int]) {
        self.word = word
        let sortedFromHardestToEasiest = associations.sorted { $0.value < $1.value }
        let values = sortedFromHardestToEasiest.map { $0.key }
        self.associations = values
    }
}
