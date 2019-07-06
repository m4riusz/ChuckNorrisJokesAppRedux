//
//  AppReducer.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    let state = state ?? AppState(
        jokeState: JokeState()
    )
    return state
}
