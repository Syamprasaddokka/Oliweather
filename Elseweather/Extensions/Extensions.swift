//
//  Extensions.swift
//  Elseweather
//
//  Created by Jarek Šedý on 15.09.2021.
//

import Foundation
import SwiftUI

extension String {
    func hasNonAsciiCharacters() -> Bool {
        return self.unicodeScalars.filter{ $0.isASCII == false } == [] ? false : true
    }
}

extension Double {
    
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toGeoCoordinate() -> String {
        let loc = Int(self)
        let reminder = Int(self.truncatingRemainder(dividingBy: 1) * 100)
        return String(loc) + "° " + String(abs(reminder)) + "′"
    }
}

extension Date {
    func convert(from initTimeZone: TimeZone, to targetTimeZone: TimeZone) -> Date {
        let delta = TimeInterval(targetTimeZone.secondsFromGMT(for: self) - initTimeZone.secondsFromGMT(for: self))
        return addingTimeInterval(delta)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

