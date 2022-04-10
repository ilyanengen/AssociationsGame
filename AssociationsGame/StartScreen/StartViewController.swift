//
//  StartViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet private weak var difficultySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var playerNameTextfield: UITextField!
    
    weak var delegate: StartViewControllerDelegate?
    
    @IBAction private func startButtonDidTap(_ sender: Any) {
        guard
            let name = playerNameTextfield.text,
            name.isEmpty == false
        else {
            showErrorAlert(message: "Введите имя")
            return
        }
        let game = Game(playerName: name,
                        difficulty: Difficulty(rawValue: difficultySegmentedControl.selectedSegmentIndex)!,
                        associations: Constants.associations)
        delegate?.startViewControllerDidCreateGame(self, game: game)
    }
}

protocol StartViewControllerDelegate: AnyObject {
    func startViewControllerDidCreateGame(_ controller: StartViewController, game: Game)
}
