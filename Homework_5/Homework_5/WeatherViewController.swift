//
//  ViewController.swift
//  Homework_5
//
//  Created by Анастасия Гаранович on 5.03.21.
//

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
            if Weather.weather.isDay == true {
                self.timesOfDayImage.image = UIImage(contentsOfFile: "day")
            }
            else {
                self.timesOfDayImage.image = UIImage(contentsOfFile: "night")
            }
        }
    }
}

