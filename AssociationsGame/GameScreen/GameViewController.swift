//
//  GameViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

protocol GameViewControllerDelegate: AnyObject {
    func gameViewControllerDidFinishGame(_ game: Game)
}
