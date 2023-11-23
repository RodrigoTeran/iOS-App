//
//  examen.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import Foundation

struct StepCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let steps: Int
    
    init(day: String, steps: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.steps = steps
    }
}


let currentWeek: [StepCount] = [
    StepCount(day: "2022-07-17", steps: 4200),
    StepCount(day: "2022-07-18", steps: 15000),
    StepCount(day: "2022-07-19", steps: 2800),
    StepCount(day: "2022-07-20", steps: 10800),
    StepCount(day: "2022-07-21", steps: 5300),
    StepCount(day: "2022-07-22", steps: 10400),
    StepCount(day: "2022-07-23", steps: 4000)
]

struct Fetching: Codable {
    var data: [Regions]
}

struct Regions: Codable {
    var country: String
    var region: String
    var cases: [String: [String : Int]]
}

struct CasesBase: Codable, Identifiable {
    var id: Int
    
    var cases: [Case]
}

struct Case: Codable {
    var day: String
    var amount: Int
}

struct CaseJson: Codable {
    var key: String
    var value: [String: Int]
}

struct CaseJsonTime: Codable {
    var total: Int
    var new: Int
}
