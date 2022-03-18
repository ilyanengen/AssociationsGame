//
//  AppViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class AppViewController: UIViewController {

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
        showStartScreen()
        controller.remove()
    }
}
