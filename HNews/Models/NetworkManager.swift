//
//  NetworkManager.swift
//  HNews
//
//  Created by Mohamed Selim on 04/11/2024.

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string:"https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    // if let safData = data >> becaus data is optional value 'data?'
                    if let safData = data {
                        // used try, catch >> becaus decode throw type
                        do {
                            // (data = safData) قم بتحليل'فك تشفير الجيسون'البيانات المستلمة
                            // results  ووضعه في 'Results' Swift وتحويلها إلى كائن JSONDecoder باستخدام
                            let decodedData = try decoder.decode(DecodedData.self, from: safData)
                            //  تحديث البيانات على الخيط الرئيسي يضمن استجابة واجهة المستخدم بشكل سليم وآمن
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                        } catch {
                            print("Failed to decode JSON: \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
}
