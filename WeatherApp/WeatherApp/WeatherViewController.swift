//
//  ViewController.swift
//  WeatherApp
//
//  Created by Decagon on 26/04/2021.
//

import UIKit
//
//var data = [WeatherData]()
//var text = " "

class WeatherViewController: UIViewController{
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var conditionName: UILabel!
    @IBOutlet var minTemp: UILabel!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var day1name: UILabel!
    @IBOutlet var day1weather: UIImageView!
    @IBOutlet var day1temp: UILabel!
    @IBOutlet var day2name: UILabel!
    @IBOutlet var day2weather: UIImageView!
    @IBOutlet var day2temp: UILabel!
    @IBOutlet var day3name: UILabel!
    @IBOutlet var day3weather: UIImageView!
    @IBOutlet var day3temp: UILabel!
    @IBOutlet var day4name: UILabel!
    @IBOutlet var day4weather: UIImageView!
    @IBOutlet var day4temp: UILabel!
    @IBOutlet var day5name: UILabel!
    @IBOutlet var day5weather: UIImageView!
    @IBOutlet var day5temp: UILabel!
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
  
        requestWeatherForLocation()
    }
    
    func requestWeatherForLocation() {
       
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=6.5833&lon=3.75&exclude=minutely,hourly,alerts&units=metric&appid=6f53e0347f39f329c5c0524ef39e08c5"

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            // Validation
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }

            // Convert data to models/some object

            var json: WeatherResponse?
            do {
                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
            }
            catch {
                print("error: \(error)")
            }

            guard let result = json else {
                return
            }

            let entries = result.daily
        
            print(entries[0].weather[0].id)
        
            DispatchQueue.main.async {
                
                self.temperatureLabel.text = "\(Int(result.current.temp))°"
                self.conditionName.text = "\(result.current.weather[0].main)"
                
                self.minTemp.text = "\(Int(entries[0].temp.min))°"
                self.currentTemp.text = "\(Int(result.current.temp))°"
                self.maxTemp.text = "\(Int(entries[0].temp.max))°"
                
                self.day1temp.text = "\(Int(entries[0].temp.day))°"
                let id = entries[0].weather[0].id
                let name = self.getConditionName(weatherId: id)
                self.day1weather.image = UIImage(named: name, in: nil, compatibleWith: nil)
                self.day1name.text = self.getDayForDate(Date(timeIntervalSince1970: Double(entries[1].dt)))
                
                self.day2temp.text = "\(Int(entries[1].temp.day))°"
                let id2 = entries[1].weather[0].id
                let name2 = self.getConditionName(weatherId: id2)
                self.day2weather.image = UIImage(named: name2, in: nil, compatibleWith: nil)
                self.day2name.text = self.getDayForDate(Date(timeIntervalSince1970: Double(entries[2].dt)))
                
                self.day3temp.text = "\(Int(entries[2].temp.day))°"
                let id3 = entries[2].weather[0].id
                let name3 = self.getConditionName(weatherId: id3)
                self.day3weather.image = UIImage(named: name3, in: nil, compatibleWith: nil)
                self.day3name.text = self.getDayForDate(Date(timeIntervalSince1970: Double(entries[3].dt)))

                
                self.day4temp.text = "\(Int(entries[3].temp.day))°"
                let id4 = entries[3].weather[0].id
                let name4 = self.getConditionName(weatherId: id4)
                self.day4weather.image = UIImage(named: name4, in: nil, compatibleWith: nil)
                self.day4name.text = self.getDayForDate(Date(timeIntervalSince1970: Double(entries[4].dt)))

                
                self.day5temp.text = "\(Int(entries[4].temp.day))°"
                let id5 = entries[4].weather[0].id
                let name5 = self.getConditionName(weatherId: id5)
                self.day5weather.image = UIImage(named: name5, in: nil, compatibleWith: nil)
                self.day5name.text = self.getDayForDate(Date(timeIntervalSince1970: Double(entries[5].dt)))

                
                print(self.getConditionName(weatherId: 804))
                print(entries[1].weather[0].id)
                
            }

        }).resume()
    }
    
    // setting the weather condition based on the id
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200...781:
            return "rain"
        case 800:
            return "clear"
        case 801...804:
            return "partlysunny"
        default:
            return "clear"
        }
    }
    

    // date formatter
    func getDayForDate(_ date:Date?)->String{
            guard let inputDate = date else{
                return ""
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: inputDate )
        }
}
