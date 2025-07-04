//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 23/05/24.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketData? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)     // Custom function
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] returnedGlobalData in
                    self?.marketData = returnedGlobalData.data
                    self?.marketDataSubscription?.cancel()
                }
            )
    }
}
