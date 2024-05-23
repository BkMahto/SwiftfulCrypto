//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by elluminati on 23/05/24.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
