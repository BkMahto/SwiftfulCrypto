//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 22/05/24.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [Coin] = []
    
//    var cancellables = Set<AnyCancellable>()
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)     // Custom function
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] returnedCoins in
                    self?.allCoins = returnedCoins
                    self?.coinSubscription?.cancel()
                }
            )
    }
}
