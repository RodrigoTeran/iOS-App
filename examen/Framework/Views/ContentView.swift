//
//  ContentView.swift
//  examen
//
//  Created by Rodrigo Terán Hernández on 23/11/23.
//

import SwiftUI

/// <#Description#>
struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        List(contentViewModel.list) { userBase in
            Text(userBase.firstName)
        }
        .onAppear {
            Task {
                await contentViewModel.geElementList()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
