//
//  ArtistAlbums.swift
//  music
//
//  Created by Calista Nguyen on 1/20/22.
//

import Foundation

//unlike classes, structs cannot have a hierarchy/inheritance
struct ArtistAlbums: Decodable {
    let name: String
    let albums: [String]
}
