//
//  JokeController.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit
import ReSwift

class JokeController: UITableViewController {
    
    fileprivate var items: [Joke] = []
 
    override func viewDidLoad() {
        self.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
        store.dispatch(JokeActions.loadNextJoke())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    fileprivate func initialize() {
        self.initTableView()
    }

    fileprivate func initTableView() {
        self.tableView.register(JokeDetailsCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(JokeDetailsCell.self, indexPath: indexPath)
        cell.update(item: self.items[indexPath.row])
        return cell
    }
}

extension JokeController: StoreSubscriber {
    func newState(state: AppState) {
        guard let joke = state.jokeState.joke else {
            return
        }
        self.items = [joke]
        self.tableView.reloadData()
    }
}
