//
//  HueExtension.swift
//  CapstoneProject
//
//  Created by Jairo Eli de Leon on 10/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

extension Hue {
    public static func fromInt(_ value: Int) -> Hue {
        switch value {
        case 1: return .monochrome
        case 2: return .red
        case 3: return .orange
        case 4: return .yellow
        case 5: return .green
        case 6: return .blue
        case 7: return .purple
        case 8: return .pink
        case -1: return .value(0)
        default: return .random
        }
    }
}

extension Hue: CustomStringConvertible {
    public var description: String {
        get {
            switch self {
            case .monochrome: return "Monochrome"
            case .red: return "Red"
            case .orange: return "Orange"
            case .yellow: return "Yellow"
            case .green: return "Green"
            case .blue: return "Blue"
            case .purple: return "Purple"
            case .pink: return "Pink"
            case .value(_): return "Value"
            case .random: return "Random"
            }
        }
    }
}
