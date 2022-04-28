//
//  Student.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

struct Student {
    let name: String
    let lastName: String
    let address: String
    let document: Document

    var fullName: String {
        "\(self.lastName), \(self.name)".lowercased().capitalized
    }
    
    var placeholder: String {
        let placeName = self.name.prefix(1).uppercased()
        let placeLastName = self.lastName.prefix(1).uppercased()
        return placeName + placeLastName
    }
}

extension Student {
    struct Document {
        let type: DocumentType
        let number: String
    }
}
