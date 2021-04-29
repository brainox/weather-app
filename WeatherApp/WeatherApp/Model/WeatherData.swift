////
////  WeatherData.swift
////  WeatherApp
////
////  Created by Decagon on 27/04/2021.
////
//
//import Foundation
//
//struct WeatherData: Codable {
//    let name: String
//    let main: Main
//    let weather: [Weather]
//}
//
//struct Main: Codable {
//    let temp: Double
//}
//
//struct Weather: Codable {
//    let id: Int
//}
//

//struct WeatherData:Codable {
//    public let list: [WeatherDetail]
//}
//struct WeatherDetail:Codable {
//    public let main: Temperature
//}
//struct Temperature:Codable {
//    public let temp: Double!
//    public let temp_min: Double!
//    public let temp_max: Double!
//}


struct WeatherResponse: Codable {
    let lat: Float
    let lon: Float
    let timezone: String
    let current: CurrentWeather
    let daily: [DailyWeather]
    let offset: Float?
}
struct CurrentWeather: Codable {
    let dt: Int
    let temp: Double
    let dew_point: Double
    let humidity: Double
    let pressure: Double
    let wind_speed: Double
    let wind_deg: Double
    let clouds: Double
    let uvi: Double?
    let visibility: Double
    let weather: [CurrWeather]
}
struct CurrWeather: Codable {
    let main: String
    let description: String
    let icon: String
}
struct DailyWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let moon_phase: Double
    let temp: Temperature
    let pressure: Double
    let humidity: Double
    let weather: [WeatherData]
}
struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
}

struct WeatherData: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
