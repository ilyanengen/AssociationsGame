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
}

extension AppViewController: StartViewControllerDelegate {
    func startViewControllerDidCreateGame(_ game: Game) {
        // TODO: pass game to GameVC
    }
}

extension AppViewController: GameViewControllerDelegate {
    func gameViewControllerDidFinishGame(_ game: Game) {
        // TODO: pass game VC to Results vc
    }
}
