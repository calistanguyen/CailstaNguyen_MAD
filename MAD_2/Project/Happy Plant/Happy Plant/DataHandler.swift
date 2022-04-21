//
//  DataHandler.swift
//  Happy Plant
//
//  Created by Calista Nguyen on 3/27/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DataHandler {
    let db = Firestore.firestore();
    var plantData = [Plant]();
    
    func getFirebaseData() async {
        do {
            let snapshot = try await db.collection("plants").getDocuments();
            self.plantData = snapshot.documents.compactMap{
                document->Plant? in
                return try? document.data(as: Plant.self)
            }
            print(self.plantData)
        } catch{
            print ("Error fetching document: \(error.localizedDescription)")
            
        }
    }
    
    func getPlants()->[Plant] {
        return plantData
    }
    
    func addPlants(_ name: String, _ type: String,  _ location: String, _ waterDay: String, _ dayToFertilize: String) {
        let plantCollection = db.collection("plants")
        let newPlant = ["name": name,
                        "type": type,
                        "location": location,
                        "waterDay": waterDay,
                        "dayToFertilize": dayToFertilize]
        
        var ref: DocumentReference? = nil
        ref = plantCollection.addDocument(data: newPlant)
        {err in
            if let err = err {
            print("Error adding document: \(err)")
            } else {
            print("Document added with ID: \(ref!.documentID)") }
        }
    }
    
    func deletePlant(id: String) {
        db.collection("plants").document(id).delete(){ err in
            if let err = err {
                print(err)
            }else {
                print("Document removed")
            }
        }
    }
    
    func updatePlant(plant: Plant)  {
        let plantsRef = db.collection("plants").document(plant.id!)
        // Set the "capital" field of the city 'DC'
        
         plantsRef.updateData([
            "name": plant.name,
            "type": plant.type,
            "location": plant.location,
            "dayToFertilize": plant.dayToFertilize,
            "waterDay": plant.waterDay
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
