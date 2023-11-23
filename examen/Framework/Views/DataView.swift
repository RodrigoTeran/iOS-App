//
//  DataView.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

//import SwiftUI

//struct DataView: View {
//    var body: some View {
//        Text("Datos")
//    }
//}

import SwiftUI
import Charts

struct DataView: View {
    var body: some View {
        VStack {
            GroupBox ( "Line Chart - Step Count") {
                Chart {
                    ForEach(currentWeek) {
                        LineMark(
                            x: .value("Week Day", $0.weekday, unit: .day),
                            y: .value("Step Count", $0.steps)
                        )
                    }
                }
            }
            
            GroupBox ( "Line Chart - Step Count") {
                Chart(currentWeek) {
                    LineMark(
                        x: .value("Week Day", $0.weekday, unit: .day),
                        y: .value("Step Count", $0.steps)
                    )
                    
                }
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
