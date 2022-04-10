//
//  GameViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class GameViewController: UIViewController {

    weak var delegate: GameViewControllerDelegate?
    
    @IBOutlet private weak var levelLabel: UILabel!
    @IBOutlet private weak var livesCountLabel: UILabel!
    @IBOutlet private weak var associationsTextView: UITextView!
    @IBOutlet private weak var answerTextField: UITextField!
    
    private var game: Game
    
    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        levelLabel.text = "\(game.levelCounter)"
        livesCountLabel.text = "\(game.livesLeft)"
        associationsTextView.text = game.getAssociationsText()
    }
    
    @IBAction private func checkAnswerDidTap(_ sender: UIButton) {
        guard let answer = answerTextField.text?.lowercased(), answer.isEmpty == false else {
            showErrorAlert(message: "Введите ответ")
            return
        }
        let isCorrectAnswer = game.checkAnswer(answer)
        updateViews()
    }
}

protocol GameViewControllerDelegate: AnyObject {
    func gameViewControllerDidFinishGame(_ controller: GameViewController, game: Game)
}
