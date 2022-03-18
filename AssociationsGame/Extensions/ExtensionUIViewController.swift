//
//  ExtensionUIViewController.swift
//  TimeCapsule
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard self.parent != nil else { return }
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func showAlert(title: String, message: String) {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true)
    }
}