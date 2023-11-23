//
//  ListRequirement.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

protocol UserListRequirementProtocol {
    func geElementList() async -> Examen?
}


class UserListRequirement: UserListRequirementProtocol {
    let dataRepository: ListRepository
    static let shared = UserListRequirement()

    init(dataRepository: ListRepository = ListRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func geElementList() async -> Examen? {
        return await dataRepository.geElementList()
    }
}
