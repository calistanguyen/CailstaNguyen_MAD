//
//  dataHandler.swift
//  Homework
//
//  Created by Calista Nguyen on 3/31/22.
//

import Foundation

class DataHandler {
    var homeworkList = [Homework]()
    func loadData(filename: String) {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                homeworkList = try plistdecoder.decode([Homework].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func getHomeworkList() -> [Homework] {
        return homeworkList
    }
    func addItem(newItem: Homework){
            homeworkList.append(newItem)
        }
    func deleteItem(index: Int){
            homeworkList.remove(at: index)
        }
    
    func dataFileURL(_ filename:String) -> URL? {
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        let url = urls.first?.appendingPathComponent(filename)
        return url
    }
    
    func saveData(fileName: String){
    //url of data file
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist") {
        do {
                    //create an instance of PropertyListEncoder
            let encoder = PropertyListEncoder()
            //set format type to xml
            encoder.outputFormat = .xml
            let encodedData = try encoder.encode(homeworkList) //write encoded data to the file
            try encodedData.write(to: pathURL) } catch {
                        print("write error")
                    }
        }else {
            print("issues saving")
        }
}
}
