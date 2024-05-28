//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 28/05/24.
//

import SwiftUI

class HapticManager {
    
    private init() { }
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
