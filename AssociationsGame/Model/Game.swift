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
    var score: Int
}

enum Difficulty {
    case easy
    case normal
    case hard
}
