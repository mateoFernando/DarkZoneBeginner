//
//  DocumentType.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

enum DocumentType: Int {
    
    typealias Information = (name: String, rangeLength: ClosedRange<Int8>)
    
    case none = 0
    case dni = 1
    case pass = 2
    case ce = 3
    
    var information: Information {
        switch self {
            case .dni: return ("DNI", 8...8)
            case .ce: return ("Carnet de exntranjería", 8...15)
            case .pass: return ("Passaporte", 8...12)
            case .none: return ("documento de indentidad", 3...20)
        }
    }
}
