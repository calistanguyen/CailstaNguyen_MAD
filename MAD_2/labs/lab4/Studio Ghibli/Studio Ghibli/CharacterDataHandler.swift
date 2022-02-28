//
//  CharacterDataHandler.string.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import Foundation

class CharacterDataHandler {
    var characters = [String: [Character]]();
    
    func loadjson(characterURL: String, speciesName: String) async {
        guard let urlPath = URL(string: characterURL)
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
            parsejson(data, speciesName)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func parsejson (_ data: Data, _ speciesName: String) {
        do
        {
            let apiData = try JSONDecoder().decode(Character.self, from: data)
            characters[speciesName]?.append(apiData)
        }
        catch let jsonErr
        {
            print(String(describing: jsonErr))
            return
        }
    }
    
}
