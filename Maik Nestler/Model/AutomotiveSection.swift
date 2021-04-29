//
//  AutomotiveSection.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 28.04.21.
//

import Foundation

enum JobSections: Int, CaseIterable {
    case technicalSupport
    case technicalDiagnostic
    case masterTech
    case school
    case tech
    
    
    var description: String {
        switch self {
        
        case .technicalSupport: return "Dealer Direct Support Engineer"
        case .technicalDiagnostic: return "Technical Support Engineer"
        case .masterTech: return "Master Technician"
        case .school: return "Master Mechanic School"
        case .tech: return "Automotive Technician"
        }
    }
}

enum CompanySection: Int, CaseIterable {
    case volvoCars
    case msx
    case infiniti
    case master
    case tlo
    
    
    var description: String {
        switch self {
        
        case .volvoCars: return "Volvo Car Germany GmbH"
        case .msx: return "MSX International"
        case .infiniti: return "Infiniti Center"
        case .master: return "BTZ Wetzlar"
        case .tlo: return "TLO Oberhessen GmbH"
        }
    }
}

enum DateSection: Int, CaseIterable {
    case volvoTime
    case msxTime
    case infinitiTime
    case masterTime
    case tloTime
    
    
    var description: String {
        switch self {
        
        case .volvoTime: return "June 2015 - current"
        case .msxTime: return "January 2015 - June 2015"
        case .infinitiTime: return "January 2014 - January 2015"
        case .masterTime: return "January 2013 - January 2014"
        case .tloTime: return "August 2008 - January 2013"
        }
    }
}
