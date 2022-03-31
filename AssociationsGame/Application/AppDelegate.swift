//
//  AppDelegate.swift
//  AssociationsGame
//
//  Created by Илья Билтуев on 18.03.2022.
//

import UIKit

/*
 Словесная игра - необходимо угадать слово по набору ассоциаций (слова или фразы из ассоциативного словаря - английский или русский).

 Статья ассоциативного словаря состоит из СЛОВА - <ассоциаиция1>X, <ассоциация2>Y..., где X и Y - частотность ассоциации (или её вес). Разработать правила игры, предусмотреть несколько уровней сложности.

 Персистенция результатов игроков в файл + 10 баллов.
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AppViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

