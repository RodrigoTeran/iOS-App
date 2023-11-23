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
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "x-api-key": "G4bfhahLLkbwQemrRapXbA==CnH99c5e3kmt8eS3"
        ]

        return headers
    }
}

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    func getElementList(url: URL, country: String, type: String) async -> [Regions]? {
        
        let parameters : Parameters = [
            "country" : country,
            "type": type
        ]
        
        let taskRequest = AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: APIManager.headers()
        ).validate()
        
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode([Regions].self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
