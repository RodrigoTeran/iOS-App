//
//  DataViewModel.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var list = [StepCountCountries]()
    
    var listRequirement: CasesListRequirementProtocol

    init(
        listRequirement: CasesListRequirementProtocol = CasesListRequirement.shared
    ) {
        self.listRequirement = listRequirement
    }
    
    func formatResponse(response: [Regions]?, country: String) -> CountryData {        
        if (response == nil) {
            return CountryData(country: country, amount: 300)
        }

        var counter = 0
        var total = 0
        
        for res in response! {
            if (counter == 0) {
                for _case in res.cases {
                    let cJson = CaseJson(key: _case.key, value: _case.value)
                                    
                    for element in cJson.value {
                        if (element.key == "total") {
                            total = total + element.value
                        }
                    }
                }
            }
            counter = counter + 1
        }
        
        return CountryData(country: country, amount: total)
    }
    
    @MainActor
    func getElementList() async {
        let type = "cases"
        self.list = [StepCountCountries]()
        
        let resultMexico = await listRequirement.getElementList(country: "Mexico", type: type)
        let resultCanada = await listRequirement.getElementList(country: "Canada", type: type)
        let resultEcuador = await listRequirement.getElementList(country: "Ecuador", type: type)
        let resultSpain = await listRequirement.getElementList(country: "Spain", type: type)
        
        let dataMexico = self.formatResponse(response: resultMexico, country: "Mexico")
        let dataCanada = self.formatResponse(response: resultCanada, country: "Canada")
        let dataEcuador = self.formatResponse(response: resultEcuador, country: "Ecuador")
        let dataSpain = self.formatResponse(response: resultSpain, country: "Spain")
        
        self.list.append(StepCountCountries(country: dataMexico.country, steps: dataMexico.amount))
        self.list.append(StepCountCountries(country: dataCanada.country, steps: dataCanada.amount))
        self.list.append(StepCountCountries(country: dataEcuador.country, steps: dataEcuador.amount))
        self.list.append(StepCountCountries(country: dataSpain.country, steps: dataSpain.amount))

    }
}
