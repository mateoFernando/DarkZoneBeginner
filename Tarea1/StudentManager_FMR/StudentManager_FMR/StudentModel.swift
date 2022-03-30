//
//  StudentModel.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 29/03/22.
//

import Foundation

struct Student {
    let name: String
    let lastName: String
    let address: String
    let dni: String
    let birthdate: String

    var nameInitials: String {
        guard let nameInital = self.name.first, let lastNameInitial = self.lastName.first else { return "" }
        return "\(nameInital)\(lastNameInitial)".uppercased()
    }

    var fullName: String {
        return "\(self.name) \(self.lastName)".capitalized
    }

    var age: Int {
        let actualYear: Int = 2022
        let arrBirth = birthdate.components(separatedBy: "/")
        guard arrBirth.count > 2, let year = Int(arrBirth[2]) else { return 0 }
        return actualYear - year
    }
}
