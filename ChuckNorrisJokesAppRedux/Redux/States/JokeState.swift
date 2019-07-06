//
//  JokeState.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

struct JokeState: StateType {
    
    var isLoading: Bool?
    var joke: Joke?
    var error: NSError?
    
    init() {
        self.init(isLoading: nil, joke: nil, error: nil)
    }
    
    init(isLoading: Bool) {
        self.init(isLoading: isLoading, joke: nil, error: nil)
    }
    
    init(joke: Joke) {
        self.init(isLoading: nil, joke: joke, error: nil)
    }
    
    init(error: NSError) {
        self.init(isLoading: nil, joke: nil, error: error)
    }
    
    fileprivate init(isLoading: Bool?, joke: Joke?, error: NSError?) {
        self.isLoading = isLoading
        self.joke = joke
        self.error = error
    }
}
