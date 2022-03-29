//
//  plant.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Plant: Codable,Identifiable {
    @DocumentID var id: String?
    var name: String
    var location: String
    var waterDay: String
    var dayToFertilize: String
}
    
