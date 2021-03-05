import Foundation

class CurrentWeather: Decodable {
    var temperatureС: Int
    var temperatureF: Int
    var humidity: Int
    var cloud: Int
    var windKPH: Double
    var isDay: Bool
    var condition: String
    var location: Location
}
