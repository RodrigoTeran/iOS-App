//
//  ContentView.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        Text("Casos")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
