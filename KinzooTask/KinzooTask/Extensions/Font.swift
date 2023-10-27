//
//  Font.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import UIKit

extension UIFont {
    
    enum Itim {
        case regular
        var value: String {
            switch self {
            case .regular:
                return "Itim-Regular"
            }
        }
    }
    
    enum Signika {
        case regular
        case medium
        case bold
        case light
        case semiBold
        
        var value: String {
            switch self {
            case .regular:
                return "SignikaNegative-Regular"
            case .medium:
                return "SignikaNegative-Medium"
            case .bold:
                return "SignikaNegative-Bold"
            case .light:
                return "SignikaNegative-Light"
            case .semiBold:
                return "SignikaNegative-SemiBold"
            }
        }
    }
    
    static func itim(_ type: Itim, size: CGFloat = 14) -> UIFont {
        return .init(name: type.value, size: size)!
    }
    
    static func signika(_ type: Signika, size: CGFloat = 14) -> UIFont {
        return .init(name: type.value, size: size)!
    }
}
