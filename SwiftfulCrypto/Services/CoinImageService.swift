//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 22/05/24.
//

import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let imageName: String
    
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    init(coin: Coin) {
        self.coin = coin
        imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkingManager.download(url: url)     // Custom function
            .tryMap({ data in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] returnedImage in
                    guard
                        let self = self,
                        let downloadedImage = returnedImage
                    else { return }
                    self.image = downloadedImage
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
                }
            )
    }
}
