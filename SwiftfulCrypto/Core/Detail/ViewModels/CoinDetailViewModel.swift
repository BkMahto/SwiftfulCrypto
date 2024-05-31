//
//  CoinDetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 29/05/24.
//

import Foundation
import Combine

class CoinDetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    
    @Published var coin: Coin
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        coinDetailDataService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetail
            .combineLatest($coin)
            .map(mapDataToStatistic)
            .sink { [weak self] returnedArray in
                self?.overviewStatistics = returnedArray.overview
                self?.additionalStatistics = returnedArray.additional
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistic(coinDetailModel: CoinDetail?, coinModel: Coin) -> (overview: [Statistic], additional: [Statistic]) {
        let overviewArray: [Statistic] = createOverviewArray(coinModel: coinModel)
        let additionalArray: [Statistic] = createAdditionalArray(coinDetailModel: coinDetailModel, coinModel: coinModel)
        return (overviewArray, additionalArray)
    }
    
    private func createOverviewArray(coinModel: Coin) -> [Statistic] {
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStats = Statistic(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "₹" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "0.0")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStats = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStats = Statistic(title: "Rank", value: rank)
        
        let volume = "₹" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "0.0")
        let volumeStats = Statistic(title: "Volume", value: volume)
        
        return [priceStats, marketCapStats, rankStats, volumeStats]
    }
    
    private func createAdditionalArray(coinDetailModel: CoinDetail?, coinModel: Coin) -> [Statistic] {
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStats = Statistic(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStats = Statistic(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStats = Statistic(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = "₹" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "0.0")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStats = Statistic(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockTimeStats = Statistic(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStats = Statistic(title: "Hashing Algorithm", value: hashing)
        
        return [highStats, lowStats, priceChangeStats, marketCapChangeStats, blockTimeStats, hashingStats]
    }
    
}
