//
//  ContentView.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    @State var value = ""
    @State var pickerValue = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Casos")
                    .font(.largeTitle)
                Form(content: {
                    Section(header: Text("País")) {
                        TextField("Mexico", text: $value)
                    }
                    Picker(selection: $pickerValue) {
                        Text("Casos").tag(0)
                        Text("Muertes").tag(1)
                    } label: {
                        Text("Tipo de casos")
                    }
                    .frame(maxWidth: .infinity)
                })
                .frame(height: 200)
                Button {
                    print("log out")
                } label: {
                    HStack(spacing: 10) {
                        Group {
                            Image(systemName: "info.circle.fill")
                                .tint(Color(UIColor.systemPurple))
                            Text("Traer datos")
                                .foregroundColor(Color(UIColor.systemPurple))
                                .bold()
                        }
                        .padding([.top, .bottom], 10)
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        Rectangle()
                            .stroke(Color(UIColor.systemPurple), lineWidth: 1)
                    )
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
