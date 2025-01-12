//
//  Crypto+Double.swift
//  UIKitSandbox
//
//  Created by Jeffrey Sweeney on 1/12/25.
//

import Foundation

extension Double {
    var asCryptoPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: self)) ?? "ERROR"
    }
    
    var asCryptoPercentage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 3
        formatter.multiplier = 1
        
        return formatter.string(from: NSNumber(value: self)) ?? "ERROR"
    }
}
