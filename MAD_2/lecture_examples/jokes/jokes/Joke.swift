//
//  Joke.swift
//  jokes
//
//  Created by Calista Nguyen on 2/15/22.
//

import Foundation


struct Joke: Decodable {
    let setup: String
    let delivery: String
}

struct JokeData: Decodable {
    var jokes = [Joke]()
}
