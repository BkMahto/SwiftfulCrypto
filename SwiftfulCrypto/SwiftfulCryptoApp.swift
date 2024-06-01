//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 21/05/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
//        UITableView.appearance().backgroundColor = UIColor(Color.theme.background)
//        UITableViewCell.appearance().backgroundColor = UIColor(Color.theme.background.opacity(0.5))
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    HomeView()
                        .toolbar(.hidden, for: .navigationBar)
                }
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .zIndex(2)
        }
    }
}
