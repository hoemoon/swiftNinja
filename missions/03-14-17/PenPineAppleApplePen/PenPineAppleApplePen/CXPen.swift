//
//  CXPen.swift
//  PenPineAppleApplePen
//
//  Created by hoemoon on 14/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class CXPen {
    internal var brandName: String
    internal var colorName: String
    internal var usagePercent: Int
    
    init(withBrand: String) {
        brandName = withBrand
        colorName = String()
        usagePercent = Int()
    }
    // getter
    func brand() -> String {
        return brandName
    }
    func color() -> String {
        return colorName
    }
    func usage() -> Int {
        return usagePercent
    }
    // setter
    func setBrand(_ name: String) {
        brandName = name
    }
    func setColor(_ name: String) {
        colorName = name
    }
    func setUsage(_ percent: Int) {
        usagePercent = percent
    }
    // display
    func printDescription() {
        print("Brand: \(self.brandName), Color: \(self.colorName), Usage: \(self.usagePercent)", terminator: ", ")
    }
}

extension CXPen: CustomStringConvertible {
    var description: String {
        return "Brand: \(self.brandName), Color: \(self.colorName), Usage: \(self.usagePercent)"
    }
}
