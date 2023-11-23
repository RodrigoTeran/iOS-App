//
//  ContentViewModel.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var list = [StepCount]()
    @Published var value = ""
    @Published var pickerValue = 0
    
    var listRequirement: CasesListRequirementProtocol

    init(
        listRequirement: CasesListRequirementProtocol = CasesListRequirement.shared
    ) {
        self.listRequirement = listRequirement
    }
    
    @MainActor
    func getElementList() async {
        var type = ""
        self.list = [StepCount]()
        
        if (pickerValue == 0) {
            type = "cases"
        } else {
            type = "deaths"
        }
        
        let result = await listRequirement.getElementList(country: value, type: type)
        
        if (result == nil) {
            return
        }
                
        var counter = 0
        
        for res in result! {
            if (counter == 0) {
                for _case in res.cases {
                    let cJson = CaseJson(key: _case.key, value: _case.value)
                    
                    var total = 0
                    
                    for element in cJson.value {
                        if (element.key == "total") {
                            total = total + element.value
                        }
                    }
                    let cDay = StepCount(day: cJson.key, steps: total)
                    self.list.append(cDay)
                }
            }
            counter = counter + 1
        }
    }
}
