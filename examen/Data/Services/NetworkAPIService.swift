//
//  NetworkAPIService.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation
import Alamofire

class APIManager {
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "user-platform": "ios"
        ]
        
        let authToken = "..."
        
        headers["Authorization"] = "Bearer" + " " + authToken

        return headers
    }
}

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    func geElementList(url: URL) async -> Examen? {
        
        let taskRequest = AF.request(
            url,
            method: .get,
            headers: APIManager.headers()
        ).validate()
        
        let response = await taskRequest.serializingData().response

        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(Examen.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
