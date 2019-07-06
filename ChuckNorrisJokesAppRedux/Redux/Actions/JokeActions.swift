//
//  JokeActions.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

struct JokeActions {
    struct Start: Action {
        
    }
    
    struct LoadNext: Action {
        
    }
    
    struct LoadSuccess: Action {
        let joke: Joke
    }
    
    struct LoadError: Action {
        let error: NSError
    }
}
