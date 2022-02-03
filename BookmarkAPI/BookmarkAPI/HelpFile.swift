//
//  HelpFile.swift
//  BookmarkAPI
//
//  Created by Vasiliy Shannikov on 27.01.2022.
//

import Foundation
struct LaureatData {
    var name = ""
    var link = ""
}

struct RequestData {
    var urlIn: String = "https://api.nobelprize.org/2.1/laureates"
    
    func post(complition: @escaping([LaureatData]) ->() )  {
        var listModel = [LaureatData]()
        let Url = String(format: urlIn)
        guard let serviceURL = URL(string: Url) else {
            return
        }
        let request = URLRequest(url: serviceURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let decoder = JSONDecoder()
                    let nobelInfo = try decoder.decode(ApiRequst.self, from:data)
                    nobelInfo.laureates.forEach { laureate in
                        let name = laureate.fullName?.en ?? "No result"
                        let link =  laureate.wikipedia?.english ?? "No Link"
                        listModel.append(LaureatData(name: name, link: link))
                    }
                  complition(listModel)
                } catch {
                    print(error)
                }
                print(data)
            }
            }.resume()
        }
    }



