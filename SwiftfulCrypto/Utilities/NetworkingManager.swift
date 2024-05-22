//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 22/05/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url):
                return "[🔥] Bad response from URL: \(url)"
            case .unknown:
                return "[⚠️] Unknown error occured"
            }
        }
    }
    
    /// A generic function that takes a url and returns a Publisher
    /// ```
    /// URLSession.shared.dataTaskPublisher(for: url)
    /// .subscribe(on: DispatchQueue.global(qos: .default))
    /// .tryMap { output in
    ///
    ///     guard
    ///         let response = output.response as? HTTPURLResponse,
    ///         response.statusCode >= 200 && response.statusCode < 300
    ///     else {
    ///         throw URLError(.badServerResponse)
    ///     }
    ///     return output.data
    /// }
    /// .receive(on: DispatchQueue.main)
    /// ```
    ///  Returns the type which is then converted
    /// ```
    /// Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, Data>, DispatchQueue>
    ///
    /// --> To convert the above type [.eraseToAnyPublisher()] is used
    /// AnyPublisher<Data, any Error>
    /// ```
    /// - Parameter url: URL of data to be downloaded
    /// - Returns: AnyPublisher that can be decoded and sink() on recieved value
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    /// It is made to be used inside of the .sink(recieveCompletion: --) which is made generic
    /// ```
    /// Subscribers.Completion<Publishers.Decode
    /// <AnyPublisher<Data, Error>, [Coin], JSONDecoder>
    /// .Failure>
    /// ```
    /// Above is the specific type which it returnes when used after .decode()
    ///
    /// -- [where it is decoded in  [Coin].self]
    ///
    ///  * It is a function for code that goes like
    ///  ```
    /// .sink { completion in
    ///     switch completion {
    ///     case .finished:
    ///         break
    ///     case .failure(let error):
    ///         print(error.localizedDescription)
    ///     }
    /// } receiveValue: { [weak self] returnedCoins in
    ///     self?.allCoins = returnedCoins
    ///     self?.coinSubscription?.cancel()
    /// }
    ///  ```
    /// - Parameter completion: Subscribers.Completion<Error> -> This is the default returning of the .sink() function
    static func handleCompletion(completion: Subscribers.Completion<Error>
    ) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
