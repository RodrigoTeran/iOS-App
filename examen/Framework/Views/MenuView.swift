//
//  MenuView.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "calendar")
                Text("Casos")
            }
            DataView().tabItem {
                Image(systemName: "book.fill")
                Text("Países")
            }
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
