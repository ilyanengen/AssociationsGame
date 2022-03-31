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
