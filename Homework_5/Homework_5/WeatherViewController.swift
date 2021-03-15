import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var timesOfDayImage: UIImageView!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tzIdLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.getWeather {
            if AppData.weather.current.is_day != 0 {
                self.timesOfDayImage.image = #imageLiteral(resourceName: "day")
            }
            else {
                self.timesOfDayImage.image = #imageLiteral(resourceName: "night")
            }
        }
    }
}

