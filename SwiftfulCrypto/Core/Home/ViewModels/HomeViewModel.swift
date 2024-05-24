//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 22/05/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistic: [Statistic] = []
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let coinDataServices = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataServices.$allCoins
//            .sink { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        // This updates all coins data
        $searchText
            .combineLatest(coinDataServices.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // This updates the market data
        marketDataService.$marketData
            .map(filterMapData)
            .sink { [weak self] returnedStats in
                self?.statistic = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterMapData(marketData: MarketData?) -> [Statistic] {
        var stats: [Statistic] = []
        guard let data = marketData else {
            return stats
        }
        let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistic(title: "24h Volume", value: data.volume)
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = Statistic(title: "Portfolio Value", value: "₹0.00", percentageChange: 0.00)

        stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])

        return stats
    }
    
    private func filterCoins(text: String, coin: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coin
        }
        let loweredcasedText = text.lowercased()
        return coin.filter({ coin in
            return coin.name.lowercased().contains(loweredcasedText) ||
            coin.symbol.lowercased().contains(loweredcasedText) ||
            coin.id.lowercased().contains(loweredcasedText)
        })
    }
}
