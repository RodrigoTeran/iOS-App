//
//  ListRepository.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

struct Api {
    static let base = "https://api.api-ninjas.com/v1"
    
    struct routes {
        static let covid = "/covid19"
    }
}

protocol ListAPIProtocol {
    func getElementList(country: String, type: String) async -> [Regions]?
}

class ListRepository: ListAPIProtocol {
    let nservice: NetworkAPIService
    static let shared = ListRepository()

    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }

    func getElementList(country: String, type: String) async -> [Regions]? {
        return await nservice.getElementList(url: URL(string:"\(Api.base)\(Api.routes.covid)")!, country: country, type: type)
    }
}
