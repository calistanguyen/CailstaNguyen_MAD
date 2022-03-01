//
//  Character.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import Foundation

struct Character: Decodable {
    var name: String
    var gender: String
    var eye_color: String
    var hair_color: String
    var films: [String]
}
