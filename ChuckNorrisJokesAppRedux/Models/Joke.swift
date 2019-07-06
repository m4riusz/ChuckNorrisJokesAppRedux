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
    let content: String
    let createdDate: Date
    let updatedDate: Date
    let url: String
    let iconUrl: String
    let categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case content = "value"
        case createdDate = "created_at"
        case updatedDate = "updated_at"
        case url = "url"
        case iconUrl = "icon_url"
        case categories = "categories"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.content = try values.decodeIfPresent(String.self, forKey: .content) ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        if let createDateString = try values.decodeIfPresent(String.self, forKey: .createdDate),
            let date = dateFormatter.date(from: createDateString) {
            self.createdDate = date
        } else {
            self.createdDate = Date()
        }
        if let updateDateString = try values.decodeIfPresent(String.self, forKey: .updatedDate),
            let date = dateFormatter.date(from: updateDateString) {
            self.updatedDate = date
        } else {
            self.updatedDate = Date()
        }
        self.url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.iconUrl = try values.decodeIfPresent(String.self, forKey: .iconUrl) ?? ""
        self.categories = try values.decodeIfPresent([String].self, forKey: .categories) ?? []
    }
}
