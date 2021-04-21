//
//  SideMenuOption.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 08.03.21.
//

import UIKit

enum SideMenuOption: Int, CustomStringConvertible {
    
    case automotive
    case hobbies
    case milestones
    case email
    case linkedIn
    case gitHub
    case instagram
    
    
    var description: String {
        switch self {
        case .automotive: return "Automotive Career"
        case .hobbies: return "Hobbies"
        case .milestones: return "Milestones"
        case .email: return "Message me"
        case .linkedIn: return "LinkedIn"
        case .gitHub: return "GitHub"
        case .instagram: return "Instagram"
        }
    }
    
    var image: UIImage {
        switch self {
        case .automotive: return UIImage(systemName: "wrench.and.screwdriver.fill") ?? UIImage()
        case .hobbies: return UIImage(systemName: "figure.walk") ?? UIImage()
        case .milestones: return UIImage(systemName: "sparkle") ?? UIImage()
        case .email: return UIImage(systemName: "envelope.fill") ?? UIImage()
        case .linkedIn: return UIImage(named: "linkedin") ?? UIImage()
        case .gitHub: return UIImage(named: "git") ?? UIImage()
        case .instagram: return UIImage(named: "insta") ?? UIImage()
        }
    }
}
