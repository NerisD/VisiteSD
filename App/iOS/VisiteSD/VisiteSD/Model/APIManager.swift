//
//  APIManager.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import Foundation

struct APIManager {
    static var shared =  APIManager()
    private let baseUrl = "http://127.0.0.1:8080/api"
    func getData(endPoint:String, handler:@escaping ([SimpleArticle])->()){
        //we want the URL API data
        let url = URL(string: baseUrl + endPoint)
        //optional binding
        if let url = url {
            //create a session to make requests -> downloading data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                
                if let error = error {
                    print("ERROR 1",error)
                }else{
                    if let data = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let articles = try decoder.decode([SimpleArticle].self , from: data)
                            handler(articles)
                        } catch  {
                            let error = error
                            print("ERROR 2 :", error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
