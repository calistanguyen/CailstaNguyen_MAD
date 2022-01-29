
import Foundation

class DataLoader {
    var allData = [MenuItem] () //initializing
    
    func loadData(filename: String) {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([MenuItem].self, from: data)
            } catch {
                print("cannot load data")
            }
        }
    }
    
    func getTypes() -> [String] {
        var types = [String] ()
        for item in allData {
            types.append(item.type)
        }
        return types
    }
    
    func getItems(index: Int) -> [String] {
        return allData[index].items
    }
}

