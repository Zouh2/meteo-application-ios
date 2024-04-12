
import Foundation

class API {
    
    let apiID = "80d9a6ece1bd131bcfe7dda82701ea59"
    var updatedCity: String = "Rabat"
    
    func getWeatherData(city: String, completion: @escaping (ForecastWeatherResponse?)->()){
        
        if city.contains(" ") {
            updatedCity = city.replacingOccurrences(of: " ", with: "%20")
        } else {
            updatedCity = city
        }
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?appid=\(apiID)&q=\(updatedCity)&units=metric&lang=fr") else {
            completion(nil)
            print("Couldn't get access to link.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                print("Error with data : \(String(describing: error?.localizedDescription))")
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                completion(weatherResponse)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
