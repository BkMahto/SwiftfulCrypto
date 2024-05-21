//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 21/05/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
