//
//  AppReducer.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState(
        jokeState: JokeState()
    )
    state.jokeState = jokeReducer(action: action, state: state.jokeState)
    return state
}
