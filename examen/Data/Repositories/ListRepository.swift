//
//  ListRepository.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

struct Api {
    static let base = "http://localhost:3001/v1"
    
    struct routes {
        static let user = "/user"
    }
}

protocol ListAPIProtocol {
    func geElementList() async -> Examen?
}

class ListRepository: ListAPIProtocol {
    let nservice: NetworkAPIService
    static let shared = ListRepository()

    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }

    func geElementList() async -> Examen? {
        return await nservice.geElementList(url: URL(string:"\(Api.base)\(Api.routes.user)")!)
    }
}
