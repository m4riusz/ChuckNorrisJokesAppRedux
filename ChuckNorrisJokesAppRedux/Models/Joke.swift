//
//  Joke.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Joke: Codable {
    let id: String
    let value: String
    let createdAt: Date
    let updatedAt: Date
    let url: String
    let iconUrl: String
    let categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case value = "value"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case url = "url"
        case iconUrl = "icon_url"
        case categories = "categories"
    }
}
