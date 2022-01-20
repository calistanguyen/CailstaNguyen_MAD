//
//  DataLoader.swift
//  music
//
//  Created by Calista Nguyen on 1/20/22.
//

import Foundation

class DataLoader {
    var allData = [ArtistAlbums] () //initializing
    //var allData: [ArtistAlbums] //defining
    
    func loadData(filename: String) {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([ArtistAlbums].self, from: data)
            } catch {
                print("cannot load data")
            }
        }
    }
    
    func getArtists() -> [String] {
        var artists = [String] ()
        for artist in allData {
            artists.append(artist.name)
        }
        return artists
    }
    
    func getAlbums(index: Int) -> [String] {
        return allData[index].albums
    }
    
    
}
