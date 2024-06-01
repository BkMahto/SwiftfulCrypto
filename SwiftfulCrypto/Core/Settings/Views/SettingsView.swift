//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 31/05/24.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com/")!
    let youtubeURL = URL(string: "https://www.youtube.com/@SwiftfulThinking")!
    let coffeeURL = URL(string: "https://buymeacoffee.com/")!
    let coingekoURL = URL(string: "https://www.coingecko.com/")!
    let personalURL = URL(string: "https://github.com/BkMahto")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.accent.opacity(0.05))
                    coinGeckoSection
                        .listRowBackground(Color.theme.accent.opacity(0.05))
                    developerSection
                        .listRowBackground(Color.theme.accent.opacity(0.05))
                    applicationSection
                        .listRowBackground(Color.theme.accent.opacity(0.05))
                }
                .scrollContentBackground(.hidden)
            }
//            .background(Color.theme.background)
            .font(.headline)
            .tint(Color.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulThinkingSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM Architecture, Combine and CodeData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit youtube 🥂", destination: youtubeURL)
            Link("Support Coffee additiction ☕️", destination: coffeeURL)
        } header: {
            Text("Swiftful Thinking")
        }
    }

    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices maybe be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingekoURL)
        } header: {
            Text("CoinGecko")
        }
    }

    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The app was developed by Bandan Kumar. It uses SwiftUI and is written in Swift. The project benifits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit GitHub 👨🏻‍💻", destination: personalURL)
        } header: {
            Text("Developer")
        }
    }
    
    private var applicationSection: some View {
        Section {
            Link("Terms of Services", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        } header: {
            Text("Application")
        }
    }
}
