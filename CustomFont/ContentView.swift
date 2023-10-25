//
//  ContentView.swift
//  CustomFont
//
//  Created by Michelle Grover on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        VStack(spacing: 20) {
                    // Hardcoded font style that won't respond to Bold Text setting
                    Text("This is hardcoded regular text")
                        .font(.custom("Helvetica", size: 20))
                    
                    Text("This is hardcoded bold text")
                        .font(.custom("Helvetica-Bold", size: 20))
                }
                .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
