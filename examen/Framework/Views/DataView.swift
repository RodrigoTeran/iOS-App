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
    @StateObject var dataViewModel = DataViewModel()
    
    var body: some View {
        VStack {
            GroupBox ("Países") {
                Chart(dataViewModel.list) {
                    BarMark(
                        x: .value("País", $0.country),
                        y: .value("Cantidad", $0.steps)
                    )
                }
            }
        }.onAppear {
            Task {
                await dataViewModel.getElementList()
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
