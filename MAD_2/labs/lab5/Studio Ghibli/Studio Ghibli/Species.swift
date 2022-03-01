//
//  Character.swift
//  Studio Ghibli
//
//  Created by Calista Nguyen on 2/26/22.
//

import Foundation

//we want to pass in species as a paramter in order to grab different species
struct Species: Decodable {
    var people = [String]()
}

struct SpeciesData {
    //create a dictionary that maps a string to an array of species
    private var speciesData = [String: [String]]();
    
    mutating func addSpecies(speciesName: String, people: [String]){
        speciesData[speciesName] = [String]()
        for i in people {
            speciesData[speciesName]!.append(i)
        }
    }
    
    func getSpeciesPeople(_ speciesName: String) -> [String]{
        return speciesData[speciesName]!;
    }
    
}
