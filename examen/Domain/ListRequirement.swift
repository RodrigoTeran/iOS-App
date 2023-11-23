//
//  ListRequirement.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

protocol CasesListRequirementProtocol {
    func getElementList(country: String, type: String) async -> [Regions]?
}


class CasesListRequirement: CasesListRequirementProtocol {
    let dataRepository: ListRepository
    static let shared = CasesListRequirement()

    init(dataRepository: ListRepository = ListRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getElementList(country: String, type: String) async -> [Regions]? {
        return await dataRepository.getElementList(country: country, type: type)
    }
}
