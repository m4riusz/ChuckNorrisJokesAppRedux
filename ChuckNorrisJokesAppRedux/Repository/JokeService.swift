//
//  JokeService.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Moya

enum JokeService {
    case random
}

extension JokeService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.chucknorris.io")!
    }
    
    var path: String {
        switch self {
        case .random:
            return "/jokes/random"
        }
    }
    
    var method: Method {
        return Method.get
    }
    
    var sampleData: Data {
        return .init()
    }
    
    var task: Task {
        switch self {
        case .random:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
