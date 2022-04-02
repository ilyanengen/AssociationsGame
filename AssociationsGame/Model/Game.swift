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
    var score: Int = 0
    
    private let levels: [Level]
    
    init(playerName: String, difficulty: Difficulty, associations: [String : [String : Int]]) {
        self.playerName = playerName
        self.difficulty = difficulty
        self.levels = associations.map { Level(word: $0.key, associations: $0.value) }
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
