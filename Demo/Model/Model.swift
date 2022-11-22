
import Foundation
import Alamofire


//MARK: - Weather API and WeatherAPI Delegate implementation
protocol WeatherAPIDelegate {
    func didUpdateWeather(weatherData: ModelForFourthViewController)
    func didFailWithError(error: Error)
}

protocol DictonaryAPIDelegate {
    func didUpdateData(data: ModelForSixthViewController)
    func update(data: Data)
    func didFailWithError(error: Error)
}

struct WeatherAPICall {
   
    var delegate: WeatherAPIDelegate?
    static let url = "https://api.openweathermap.org/data/2.5/weather?appid=b37a8defab26abf33b00a3227ef9618c&units=metric"
    
    func getRequestWithAlamofire(url: String, parameters: [ String: String])  {
        let request = AF.request(url, parameters: parameters)
      
        _ = request.responseDecodable(of: ModelForFourthViewController.self) { response in
            
            switch response.result {
            case let .success(data):
                print("success")
                WeatherData.model.append(ModelForFourthViewController(name: data.name,
                                                                      coord: data.coord,
                                                                      weather: data.weather,
                                                                      main: data.main,
                                                                      wind: data.wind,
                                                                      clouds: data.clouds,
                                                                      sys: data.sys,
                                                                      timezone: data.timezone,
                                                                      id: data.id,
                                                                      cod: data.cod))
              
                delegate?.didUpdateWeather(weatherData: data)
                
                
            case let .failure(error):
                print("error")
                delegate?.didFailWithError(error: error)
            }
        }
        
    }
}


struct DemoAPICall {
   
    var delegate: WeatherAPIDelegate?
    var delelgateTwo: DictonaryAPIDelegate?
    
    func getRequestWithAlamofire<T:Decodable>(url: String, parameters: [ String: String], model: T.Type)  {
        var request = AF.request(url, parameters: parameters)
        if model == ModelForSixthViewController.self{
            request = AF.request("https://api.dictionaryapi.dev/api/v2/entries/en/heaven")
        }
        //print("Model : \(model)")
        
        _ = request.responseDecodable(of: model ) { response in
                switch response.result {
                case let .success(data):
                    if model == ModelForFourthViewController.self {
                        delegate?.didUpdateWeather(weatherData: data as! ModelForFourthViewController)
                        WeatherData.updateModel(weatherData: data as! ModelForFourthViewController)
                    } else if model == ModelForSixthViewController.self {
                        print("true")
                        delelgateTwo?.didUpdateData(data: data as! ModelForSixthViewController)
                       // WeatherData.updateModel(data: data as! ModelForSixthViewController)
                    }
                case let .failure(error):
                    
                    if model == ModelForFourthViewController.self {
                        delegate?.didFailWithError(error: error)
                    } else if model == ModelForSixthViewController.self {
                        print("false")
                        delelgateTwo?.didFailWithError(error: error)
                    }
                    
                }
            }
         
    }
}


struct Demo {
   
    var delegate: DictonaryAPIDelegate?
    //var realURL = URL(string: Demo.url)
    
    func getRequestWithAlamofire()  {
        let request = AF.request("https://api.dictionaryapi.dev/api/v2/entries/en/heaven")
        //print("request: \(request)")
        _ = request.responseDecodable(of: ModelForSixthViewController.self) { response in
            
            switch response.result {
            case let .success(data):
                print("success")
                debugPrint("data: \(data)")
                
                //delegate?.update(data: data)
                
                
            case let .failure(error):
                print("error: \(error)")
                delegate?.didFailWithError(error: error)
            }
        }
        
    }
}






//MARK: - ModelForFistPageTV
struct ModelForMessagesPage {
    static let profileImage: [String] = [
        "messagesProfileImage-1",
        "messagesProfileImage-2",
        "messagesProfileImage-3",
        "messagesProfileImage-4",
        "messagesProfileImage-5",
        "messagesProfileImage-6",
        "messagesProfileImage-7",
        "messagesProfileImage-8",
    ]
    static let nameText: [String] = [
        "Ariana Gray",
        "Kristin Watson",
        "Cameron Williamson",
        "Jacob Jones",
        "Esther Howard",
        "Floyd Miles",
        "Wade Warren",
        "Savannah Nguyen",
    ]
    static let isSeen: [Bool] = [
        false,
        false,
        false,
        false,
        true,
        true,
        true,
        true,
        
    ]
    
    static let lastMessage: [LastMessage] = [
        LastMessage.Text,
        LastMessage.Video,
        LastMessage.Image,
        LastMessage.Text,
        LastMessage.Video,
        LastMessage.Video,
        LastMessage.Text,
        LastMessage.Text,
    ]
    static let messagesText: [String] = [
        "How are you ?",
        "na",
        "Image",
        "Send it quickly ⏩",
        "na",
        "na",
        "Why not ? 🙄",
        "Browse recordings of end to end user.....",
    ]
    static let timeText: [String] = [
        "4:42",
        "2:28",
        "Yesterday",
        "7/11/2022",
        "na",
        "na",
        "na",
        "na",
    ]
    static let notificationText: [String] = [
        "2",
        "7",
        "3",
        "1",
        "na",
        "na",
        "na",
        "na",
    ]
    
}

enum LastMessage {
    case Text
    case Video
    case Image
    
}
