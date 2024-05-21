//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 21/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40.0) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
