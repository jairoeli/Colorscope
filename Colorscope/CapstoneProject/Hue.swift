//
//  Hue.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

public enum Hue {
    
    case monochrome, red, orange, yellow, green, blue, purple, pink
    case value(Int)
    case random

    public func toInt() -> Int {
        switch self {
        case .monochrome: return 1
        case .red: return 2
        case .orange: return 3
        case .yellow: return 4
        case .green: return 5
        case .blue: return 6
        case .purple: return 7
        case .pink: return 8
        case .value(_): return -1
        case .random: return 0
        }
    }
}

public func == (lhs: Hue, rhs: Hue) -> Bool {
    return lhs.toInt() == rhs.toInt()
}

extension Hue: Hashable {
    public var hashValue: Int {
        get {
            return self.toInt()
        }
    }
}
