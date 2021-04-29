////
////  WeatherModel.swift
////  WeatherApp
////
////  Created by Decagon on 27/04/2021.
////
//
//import Foundation

struct WeatherModel: Codable {
    let conditionId: Int
    
    var conditionName: String {
        switch conditionId {
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


}
