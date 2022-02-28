//
//  CharacterDataHandler.string.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import Foundation

class FilmDataHandler {
    var title: String = ""
    func loadjson(filmURL: String, characterName: String) async {
        guard let urlPath = URL(string: filmURL)
            else {
                print("url error")
                return
            }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: urlPath, delegate: nil)
            guard (response as? HTTPURLResponse)?.statusCode == 200
                else {
                    print("file download error")
                    return
                }
            parsejson(data, characterName)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func parsejson (_ data: Data, _ characterName: String) {
        do
        {
            
            let apiData = try JSONDecoder().decode(Film.self, from: data)
            title = apiData.title
            
        }
        catch let jsonErr
        {
            print(String(describing: jsonErr))
            return
        }
    }
    
    func getFilmTitle(_ characterName: String) -> String{
        return title; 
    }
    
    
}
