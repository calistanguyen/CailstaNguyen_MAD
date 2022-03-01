import Foundation

class SpeciesDataHandler {
    var speciesData = SpeciesData()
    
    func loadjson(speciesName: String) async {
        guard let urlPath = URL(string: "https://ghibliapi.herokuapp.com/species/?name=\(speciesName)")
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
            //download successful
            print("download complete")
            print("data: ", data);
            parsejson(data, speciesName)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func parsejson (_ data: Data, _ speciesName: String) {
        do
        {
            let apiData = try JSONDecoder().decode([Species].self, from: data)
            speciesData.addSpecies(speciesName: speciesName, people: apiData[0].people)
        }
        catch let jsonErr
        {
            print(String(describing: jsonErr))
            return
        }
    }
    
    func getSpeciesByType(_ speciesName: String) -> [String]{
        return speciesData.getSpeciesPeople(speciesName);
    }
}
