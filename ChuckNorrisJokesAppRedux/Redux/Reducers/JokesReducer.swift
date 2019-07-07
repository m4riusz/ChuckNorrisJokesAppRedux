//
//  JokesReducer.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

func jokeReducer(action: Action, state: JokeState?) -> JokeState {
    var state = state ?? JokeState()
    switch action {
    case _ as JokeActions.LoadNext:
        state.state = .loading
    case let action as JokeActions.LoadSuccess:
        state.state = .success(action.joke)
    case let action as JokeActions.LoadError:
        state.state = .error(action.error)
    default:
        break
    }
    return state
}
