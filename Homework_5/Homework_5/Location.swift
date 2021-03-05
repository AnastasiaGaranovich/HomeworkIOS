import Foundation

class Location: Decodable {
    var city: String
    var country: String
    var tzId: String
    var localTime: Date
}
