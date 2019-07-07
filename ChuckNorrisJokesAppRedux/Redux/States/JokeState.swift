//
//  JokeState.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

struct JokeState: StateType {
    enum State {
        case start
        case loading
        case success(_ item: Joke)
        case error(_ error: NSError)
    }
    var state: State = .start
}
