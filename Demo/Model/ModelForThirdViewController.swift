//
//  ModelForThirdViewController.swift
//  Demo
//
//  Created by wOOx Technology on 22/11/22.
//

import Foundation

struct ModelForFourthViewController: Decodable {
    
    static let url: String = "https://api.openweathermap.org/data/2.5/weather?appid=b37a8defab26abf33b00a3227ef9618c&units=metric"
    
    let name: String
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    let timezone: Int
    let id: Int
    let cod: Int
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}


struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
struct Clouds: Codable {
    let all: Int
}


struct Sys: Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}


struct WeatherData {
    static var model: [ModelForFourthViewController] = []
    static func updateModel(weatherData: ModelForFourthViewController){
        WeatherData.model.append(ModelForFourthViewController(name: weatherData.name,
                                                              coord: weatherData.coord,
                                                              weather: weatherData.weather,
                                                              main: weatherData.main,
                                                              wind: weatherData.wind,
                                                              clouds: weatherData.clouds,
                                                              sys: weatherData.sys,
                                                              timezone: weatherData.timezone,
                                                              id: weatherData.id,
                                                              cod: weatherData.cod))
    }
}
