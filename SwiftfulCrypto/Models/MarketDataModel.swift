//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 23/05/24.
//

import Foundation

// JSON
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 14395,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1101,
     "total_market_cap": {
       "btc": 39214914.7073221,
       "eth": 711966917.486792,
       "ltc": 31833021934.5778,
       "bch": 5420722622.72005,
       "bnb": 4487012108.05026,
       "eos": 3243696238794.37,
       "xrp": 5193554426437.75,
       "xlm": 24787316050230,
       "link": 164916131486.272,
       "dot": 367192887652.288,
       "yfi": 382964341.707282,
       "usd": 2726833614570.87,
       "aed": 10015741671327.2,
       "ars": 2.42690445697473e+15,
       "aud": 4106556886871.42,
       "bdt": 319805230510597,
       "bhd": 1027874477345.26,
       "bmd": 2726833614570.87,
       "brl": 14058736066643,
       "cad": 3727772429471.39,
       "chf": 2491131570594.59,
       "clp": 2450578101078690,
       "cny": 19373062098080.2,
       "czk": 62196077958219.1,
       "dkk": 18762524051777.8,
       "eur": 2514336924654.59,
       "gbp": 2142983088854.25,
       "gel": 7416987431632.76,
       "hkd": 21291234116414.8,
       "huf": 973525048537655,
       "idr": 43755332827302696,
       "ils": 10007138511273.3,
       "inr": 226972923297148,
       "jpy": 427325913306459,
       "krw": 3716095091737029,
       "kwd": 836993397491.683,
       "lkr": 818804282919713,
       "mmk": 5732802507984914,
       "mxn": 45396135137022.7,
       "myr": 12828388739748.6,
       "ngn": 3947091657091340,
       "nok": 29007554254419.8,
       "nzd": 4450274263988.1,
       "php": 158718077369712,
       "pkr": 759871578538568,
       "pln": 10723417711481.5,
       "rub": 246772274021027,
       "sar": 10226711334419.4,
       "sek": 29140569198138.6,
       "sgd": 3679630182006.15,
       "thb": 99626114998142.2,
       "try": 87816585823809.1,
       "twd": 87798043355230,
       "uah": 108615157457412,
       "vef": 273037849826.981,
       "vnd": 69455772148489760,
       "zar": 50079365523537.2,
       "xdr": 2062241545526.81,
       "xag": 89183902003.1634,
       "xau": 1152250812.17307,
       "bits": 39214914707322.1,
       "sats": 3921491470732212
     },
     "total_volume": {
       "btc": 1448982.27146858,
       "eth": 26307017.343018,
       "ltc": 1176222995.12133,
       "bch": 200294480.747741,
       "bnb": 165794087.40154,
       "eos": 119853845893.098,
       "xrp": 191900667028.873,
       "xlm": 915885748627.313,
       "link": 6093613937.10163,
       "dot": 13567694546.5388,
       "yfi": 14150446.2238414,
       "usd": 100755888269.726,
       "aed": 370079400291.352,
       "ars": 89673573408228.6,
       "aud": 151736352616.441,
       "bdt": 11816731281740,
       "bhd": 37979730571.4966,
       "bmd": 100755888269.726,
       "brl": 519467133152.227,
       "cad": 137740352176.894,
       "chf": 92046750799.4674,
       "clp": 90548309229120,
       "cny": 715830283801.094,
       "czk": 2298131080711.24,
       "dkk": 693271040417.503,
       "eur": 92904183408.6427,
       "gbp": 79182742764.6301,
       "gel": 274056016093.655,
       "hkd": 786706308113.216,
       "huf": 35971531410682,
       "idr": 1.61674969898968e+15,
       "ils": 369761515463.861,
       "inr": 8386598426020.75,
       "jpy": 15789596308992.3,
       "krw": 137308877176086,
       "kwd": 30926717636.7275,
       "lkr": 30254633947519,
       "mmk": 211825762261565,
       "mxn": 1677376975002.22,
       "myr": 474006076364.925,
       "ngn": 145844148270429,
       "nok": 1071822600329.9,
       "nzd": 164436632332.841,
       "php": 5864597232627.66,
       "pkr": 28077083785921.1,
       "pln": 396227870682.775,
       "rub": 9118179978590.93,
       "sar": 377874681855.004,
       "sek": 1076737472559.7,
       "sgd": 135961506969.492,
       "thb": 3681162524131.27,
       "try": 3244803079371.22,
       "twd": 3244117939330.99,
       "uah": 4013305619638.96,
       "vef": 10088687092.4477,
       "vnd": 2.56637514694203e+15,
       "zar": 1850421283625.83,
       "xdr": 76199360912.9635,
       "xag": 3295325104.42631,
       "xau": 42575408.1472554,
       "bits": 1448982271468.58,
       "sats": 144898227146858
     },
     "market_cap_percentage": {
       "btc": 50.2411307496889,
       "eth": 16.8854228766185,
       "usdt": 4.09001627447477,
       "bnb": 3.42774357985492,
       "sol": 2.86018973793256,
       "steth": 1.30832777446277,
       "usdc": 1.20623758509152,
       "xrp": 1.0637240067981,
       "doge": 0.875148970855429,
       "ton": 0.82099178541461
     },
     "market_cap_change_percentage_24h_usd": -0.161088952323579,
     "updated_at": 1716462235
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketData
}

struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "inr" }) {
            return "₹" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "inr" }) {
            return "₹" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentageString()
        }
        return ""
    }
}
