//
//  StartViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    weak var delegate: StartViewControllerDelegate?
    
    private let resultsFileManager: ResultsFileManager
    
    @IBOutlet private weak var difficultySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var playerNameTextfield: UITextField!

    init (resultsFileManager: ResultsFileManager) {
        self.resultsFileManager = resultsFileManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func showHighScoreDidTap(_ sender: Any) {
        guard let results = resultsFileManager.getResultsFromFile() else { return }
        showAlert(title: "Результаты", message: results)
    }
    
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
