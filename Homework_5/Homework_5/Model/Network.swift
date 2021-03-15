import Foundation
import Alamofire

class Network {
    static let weatherPath = "https://api.weatherapi.com/v1/current.json?key=c47efa6006484f2fb57113615210503&q=Minsk&aqi=yes"
    
    static func getWeather(_ completion: @escaping () -> ()) {
        AF.request(weatherPath).responseData {
            response in
            switch response.result {
            case .success(let value):
                do {
                    AppData.weather = try JSONDecoder().decode(Weather.self, from: value)
                    DispatchQueue.main.async {
                        completion()
                    }
                } catch let error {
                    print(error)
                }
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
