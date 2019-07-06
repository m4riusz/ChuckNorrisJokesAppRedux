//
//  JokeActions.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift
import Moya

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
    
    static func loadNextJoke() -> Action {
        MoyaProvider<JokeService>().request(.random) { result in
            switch result {
            case .success(let response):
                do {
                    let joke = try response.map(Joke.self)
                    store.dispatch(LoadSuccess(joke: joke))
                } catch let error {
                    store.dispatch(LoadError(error: error as NSError))
                }
            case .failure(let error):
                store.dispatch(LoadError(error: error as NSError))
            }
        }
        return LoadNext()
    }
}
