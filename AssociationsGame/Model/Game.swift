//
//  Game.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import Foundation

class Game {
    let playerName: String
    let difficulty: Difficulty
    var livesLeft: Int
    let levels: [Level]
    var score: Int = 0
    
    var levelCounter: Int {
        return levelIndex + 1
    }
    
    private var levelIndex: Int = 0
    private var tryCounter: Int = 0
    
    init(playerName: String, difficulty: Difficulty, associations: [String : [String : Int]]) {
        self.playerName = playerName
        self.difficulty = difficulty
        self.livesLeft = difficulty.lives
        self.levels = associations.map { Level(word: $0.key, associations: $0.value) }
    }
    
    // MARK: - Public methods
    
    func getAssociationsText() -> String {
        let allLevelAssociations = levels[levelIndex].associations
        let associationsForTry = Array(allLevelAssociations[0...tryCounter])
        return associationsForTry.joined(separator: ", ")
    }
    
    func handleAnswer(_ answer: String) -> GameResult {
        let isCorrect = answer == getAnswerWord()
        var isMoreLevels: Bool? = nil
        
        if isCorrect {
            score += difficulty.scoreRate
            isMoreLevels = moveToNextLevelIfExist()
        } else {
            if livesLeft > 1 {
                livesLeft -= 1
                tryCounter += 1 // для добавления подсказок (еще ассоциации)
            } else {
                livesLeft = 0 // game over
            }
        }
        
        return buildResult(isCorrect: isCorrect, isMoreLevels: isMoreLevels)
    }
    
    // MARK: - Private methods
    
    private func getAnswerWord() -> String {
        return levels[levelIndex].word
    }
    
    private func moveToNextLevelIfExist() -> Bool {
        if (levelIndex + 1) < levels.count {
            levelIndex += 1
            tryCounter = 0
            return true
        } else {
            print("ERROR! moveToNextLevel failed")
            return false
        }
    }
    
    private func buildResult(isCorrect: Bool, isMoreLevels: Bool?) -> GameResult {
        
        if isCorrect {
            
            if let isMoreLevels = isMoreLevels, isMoreLevels == true {
                return GameResult(resultTitle: "ВЕРНО",
                                  resultMessage: "Молодец! Переходим на следующий уровень")
            } else {
                return GameResult(resultTitle: "ВЕРНО",
                                  resultMessage: "ПОЗДРАВЛЯЕМ! Вы прошли все уровни. Счёт: \(score)")
            }
            
        } else {
            
            if livesLeft == 0 {
                return GameResult(resultTitle: "GAME OVER",
                                  resultMessage: "Правильный ответ: \(getAnswerWord()).\nСчёт: \(score)")
            } else {
                return GameResult(resultTitle: "НЕВЕРНО",
                                  resultMessage: "Попробуй ещё! :)")
            }
        }
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
    
    var scoreRate: Int {
        switch self {
        case .easy:   return 1
        case .normal: return 2
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

struct GameResult {
    let resultTitle: String
    let resultMessage: String
}
