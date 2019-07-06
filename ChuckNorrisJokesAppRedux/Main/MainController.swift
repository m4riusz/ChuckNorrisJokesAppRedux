//
//  MainController.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
    
    override func viewDidLoad() {
        let jokeController = JokeController()
        jokeController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        let jokesController = JokesController()
        jokesController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.viewControllers = [jokeController, jokesController]
    }
}
