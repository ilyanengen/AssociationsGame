//
//  StartViewController.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    weak var delegate: StartViewControllerDelegate? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

protocol StartViewControllerDelegate: AnyObject {
    func startViewControllerDidCreateGame(_ game: Game)
}
