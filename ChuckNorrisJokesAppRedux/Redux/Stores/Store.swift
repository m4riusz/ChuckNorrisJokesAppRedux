//
//  Store.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import ReSwift

let store = Store(
    reducer: appReducer,
    state: nil,
    middleware: []
)
