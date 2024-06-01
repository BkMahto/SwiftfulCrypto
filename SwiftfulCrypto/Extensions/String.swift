//
//  String.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 31/05/24.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
