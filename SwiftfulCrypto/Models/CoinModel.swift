//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 21/05/24.
//

import Foundation

// CoinGeko API info
/*
 URl: https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response :
 
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 5913507,
 "market_cap": 116503844585156,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 124183645042943,
 "total_volume": 3809909082626,
 "high_24h": 5968382,
 "low_24h": 5565548,
 "price_change_24h": 337660,
 "price_change_percentage_24h": 6.05575,
 "market_cap_change_24h": 6610028702266,
 "market_cap_change_percentage_24h": 6.01492,
 "circulating_supply": 19701312,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 6110932,
 "ath_change_percentage": -3.17158,
 "ath_date": "2024-03-14T07:10:36.635Z",
 "atl": 3993.42,
 "atl_change_percentage": 148071.74626,
 "atl_date": "2013-07-05T00:00:00.000Z",
 "roi": null,
 "last_updated": "2024-05-21T09:30:38.913Z",
 "sparkline_in_7d": {
 "price": [62662.1721964785, 62014.6638600791, 62019.2338199041, 61861.3941816, 61779.0183496068, 61715.743114837, 61756.1239043292, 61550.8837137948, 61679.0068351826, 61587.2363716017, 61776.0807182984, 61386.500454979, 61262.5472443901, 61386.57080492, 61557.4619494496, 61585.4668220812, 61689.6628855259, 61678.8261453055, 61539.7095835452, 61406.8118952363, 61667.006911218, 61745.5770806963, 61903.8060177492, 61892.0792229213, 61883.843642358, 61964.1936238999, 62150.8311637395, 62125.7446587127, 62722.5726226926, 62698.4090006938, 62418.5869548234, 63714.050458542, 64119.492343798, 64399.3409467384, 64662.7678907119, 64786.185623548, 65119.0117218858, 65718.6469512833, 65954.612340592, 65979.6389588638, 65913.610760651, 66150.9376290275, 66228.7733761401, 66101.2347597435, 66004.4413894373, 65917.3775181692, 65991.3213734258, 65846.2301982539, 65796.8110668272, 65928.6535309162, 66175.7063146836, 66306.7630718028, 66369.9776700204, 66209.1855528215, 66517.0526990723, 66246.3641800432, 66318.3084726776, 65575.0488864168, 65837.6510256416, 65103.7773699275, 65005.7207958744, 65125.451767518, 65241.0427072294, 65288.9886723019, 65443.6152031991, 65408.3549091597, 65260.8798033462, 65467.6418308006, 65357.1499920741, 65397.0367245399, 65659.122248431, 65468.2792124806, 65666.8405337502, 65995.851848015, 66466.784919119, 66100.6210847994, 66306.0175116928, 66507.9904145767, 66208.5544260377, 66519.9290522343, 65927.7260269213, 67030.7057152642, 67246.8065311441, 66917.7823279936, 66498.1922743629, 66877.8333168896, 66912.592231839, 66949.2236351229, 66859.2115167561, 66770.1031797284, 67059.0704564629, 66923.9146529521, 67076.6386869794, 66931.3033463659, 66977.5150418991, 66851.5381430639, 66871.2368049977, 66954.6353662343, 66845.1970341631, 67101.6686989746, 67147.2910703018, 67287.5015385925, 67240.2772441603, 66922.8888774659, 66899.1557057914, 66834.229157437, 66873.7570466393, 66885.2040640531, 66839.0768765717, 66806.9029868712, 66993.1614955724, 67012.1125479786, 66910.724276826, 66944.2964054174, 66987.5730179022, 66887.215136912, 66946.1972277158, 67189.4518742133, 67185.0376618359, 67159.4053863194, 67094.877021689, 67044.7937781117, 67330.1662242536, 67170.2349673005, 67212.6153533857, 67221.9389933413, 67340.4862614642, 66843.9034975595, 67023.4187639714, 66874.373319103, 66844.7156229581, 66739.5334275787, 66651.5020815051, 66574.7350680784, 66062.365842237, 66276.8430096983, 66270.4650405241, 66307.3178991679, 66272.6424956109, 66508.5157465823, 66522.789721351, 66657.7798818875, 66644.6418080392, 67130.5582422584, 67153.6771169324, 66229.1954708246, 66865.3845967598, 66769.9702631687, 66884.6961815729, 67164.0146772693, 67004.7918834751, 66942.838008255, 67077.7921627977, 67014.3702652234, 67381.923036019, 68180.5440475866, 68349.2722575969, 68738.3963582489, 70049.0980977918, 69377.7473774516, 69632.2787754771, 69611.3905181228, 71464.3145362691, 71262.1022999113, 71073.2781600892, 71348.5780213252, 71292.6023734386, 70911.6749813864]
 },
 "price_change_percentage_24h_in_currency": 6.05575470804694
 }
 
 */

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double?
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(
            id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice,
            marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply,
            totalSupply: totalSupply, maxSupply: maxSupply,
            ath: ath, athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl, atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
