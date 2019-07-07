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
    
    fileprivate var stateLabel: UILabel?
    fileprivate var items: [Joke] = []
 
    override func viewDidLoad() {
        self.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    fileprivate func initialize() {
        self.title = "Chuck Norris jokes"
        self.initTableView()
        self.initStateLabel()
        self.initRefreshControll()
    }

    fileprivate func initTableView() {
        self.tableView.register(JokeCell.self)
        self.tableView.allowsSelection = false
        self.tableView.separatorColor = .clear
    }
    
    fileprivate func initStateLabel() {
        self.stateLabel = UILabel()
        self.stateLabel?.numberOfLines = 0
        self.stateLabel?.textAlignment = .center
        self.stateLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        self.tableView.backgroundView = self.stateLabel
        
        self.stateLabel?.snp.makeConstraints({ [unowned self] make in
            make.edges.equalTo(self.tableView.safeAreaLayoutGuide.snp.edges)
        })
    }
    
    fileprivate func initRefreshControll() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pulledToRefresh), for: .valueChanged)
        self.refreshControl = refreshControl
    }
    
    @objc fileprivate func pulledToRefresh() {
        store.dispatch(JokeActions.loadNextJoke())
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(JokeCell.self, indexPath: indexPath)
        cell.update(item: self.items[indexPath.row])
        return cell
    }
}

extension JokeController: StoreSubscriber {
    func newState(state: AppState) {
        switch state.jokeState.state {
        case .start:
            self.items = []
            self.stateLabel?.text = "Pull to load joke"
            self.stateLabel?.textColor = .darkGray
            self.tableView.backgroundView?.isHidden = false
            self.refreshControl?.endRefreshing()
        case .loading:
            self.items = []
            self.stateLabel?.text = "Loading..."
            self.stateLabel?.textColor = .darkGray
            self.tableView.backgroundView?.isHidden = false
            self.refreshControl?.beginRefreshing()
        case .success(let joke):
            self.items = [joke]
            self.stateLabel?.text = ""
            self.stateLabel?.textColor = .darkGray
            self.tableView.backgroundView?.isHidden = true
            self.refreshControl?.endRefreshing()
        case .error(let error):
            self.items = []
            self.stateLabel?.text = error.localizedDescription
            self.stateLabel?.textColor = .red
            self.tableView.backgroundView?.isHidden = false
            self.refreshControl?.endRefreshing()
        }
        self.tableView.reloadData()
    }
}
