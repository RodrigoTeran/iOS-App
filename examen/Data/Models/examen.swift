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

struct StepCountCountries: Identifiable {
    let id = UUID()
    let country: String
    let steps: Int
    
    init(country: String, steps: Int) {
        self.country = country
        self.steps = steps
    }
}

struct CountryData: Codable {
    var country: String
    var amount: Int
}

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
