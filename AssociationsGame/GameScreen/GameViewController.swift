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

    }
    
    @IBAction private func checkAnswerDidTap(_ sender: UIButton) {
        print("check button tap!")
    }
}

protocol GameViewControllerDelegate: AnyObject {
    func gameViewControllerDidFinishGame(_ controller: GameViewController, game: Game)
}
