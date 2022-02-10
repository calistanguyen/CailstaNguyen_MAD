//
//  DataLoader.swift
//  Pokemon Log
//
//  Created by Calista Nguyen on 2/8/22.
//

import Foundation

class DataLoader {
    var allData = [PokemonData]()
    
    func loadData(fileName: String) {
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([PokemonData].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getTypes() -> [String] {
        var types = [String]()
        for i in allData{
            types.append(i.type)
        }
        return types
    }
    
    func getIcon(idx: Int) -> String {
        return allData[idx].icon
    }
    
    func getPokemon(idx: Int) -> [String] {
        return allData[idx].pokemon
    }
    
    func deletePokemon(typeIdx: Int, countryIdx: Int) {
        allData[typeIdx].pokemon.remove(at: countryIdx)
    }
    
    func addPokemon(typeIdx: Int, pokemon: String) {
        allData[typeIdx].pokemon.append(pokemon)
    }
    
}
