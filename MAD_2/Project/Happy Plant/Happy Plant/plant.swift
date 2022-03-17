//
//  plant.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/10/22.
//

import Foundation

struct Plant {
    var name: String
    var plantType: String
    var location: String
    var waterDay: String
    var dayToFertilize: String
}

var testPlantData: [Plant] = [
    Plant(name: "Monstera", plantType: "monstera", location: "bedroom", waterDay: "Wednesday",  dayToFertilize:"March 16, 2022"),
    Plant(name: "Viney boy", plantType: "pothos", location: "bedroom", waterDay: "Wednesday",  dayToFertilize:"May 10, 2000"),
    Plant(name: "String of Hearts", plantType: "string of hearts", location: "office", waterDay: "Wednesday",  dayToFertilize:"May 10, 2000"),
    Plant(name: "Snakey", plantType: "snake plant", location: "living room ", waterDay: "Wednesday",  dayToFertilize:"May 10, 2000"),
]
    
