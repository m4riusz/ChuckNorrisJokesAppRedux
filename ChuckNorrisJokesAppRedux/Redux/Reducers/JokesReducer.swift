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
    case _ as JokeActions.Start:
        state.isLoading = nil
        state.error = nil
        state.joke = nil
    case _ as JokeActions.LoadNext:
        state.isLoading = true
        state.error = nil
        state.joke = nil
    case let action as JokeActions.LoadSuccess:
        state.isLoading = false
        state.error = nil
        state.joke = action.joke
    case let action as JokeActions.LoadError:
        state.isLoading = false
        state.error = action.error
        state.joke = nil
    default:
        break
    }
    return state
}
