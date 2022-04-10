//
//  AppViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class AppViewController: UIViewController {
    
    private let fileManager = ResultsFileManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        showStartScreen()
    }
    
    private func showStartScreen() {
        let startVC = StartViewController()
        startVC.delegate = self
        add(startVC)
    }
    
    private func showGameScreen(game: Game) {
        let gameVC = GameViewController(game: game)
        gameVC.delegate = self
        add(gameVC)
    }
}

extension AppViewController: StartViewControllerDelegate {
    func startViewControllerDidCreateGame(_ controller: StartViewController, game: Game) {
        showGameScreen(game: game)
        controller.remove()
    }
}

extension AppViewController: GameViewControllerDelegate {
    func gameViewControllerDidFinishGame(_ controller: GameViewController, game: Game) {
        saveResults(game)
        showStartScreen()
        controller.remove()
    }
    
    private func saveResults(_ game: Game) {
        let resultString = game.playerName + " - " + "\(game.score)"
        fileManager.addResultToFile(resultString)
        
        if let allResults = fileManager.getResultsFromFile() {
            print("HIGH SCORE:\n\(allResults)")
        }
    }
}
