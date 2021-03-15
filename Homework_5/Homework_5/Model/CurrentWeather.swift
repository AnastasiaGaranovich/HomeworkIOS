import Foundation

class CurrentWeather: Codable {
    var temp_c: Double
    var temp_f: Double
    var humidity: Int
    var cloud: Int
    var wind_kph: Double
    var is_day: Int
    var condition: Condition
}
