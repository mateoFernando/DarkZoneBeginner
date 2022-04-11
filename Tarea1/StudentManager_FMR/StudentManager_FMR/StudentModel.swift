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

    static func build() -> Student {
        print("\n\n***** Agregando alumno *****\n\n")
        let firstName = Input.Text(message: "Ingrese el nombre",
                                   errorMessage: "Nombre no válido",
                                   minLength: 3,
                                   maxLength: 30).getInput()

        let lastName = Input.Text(message: "Ingrese el apellido",
                                   errorMessage: "Apellido no válido",
                                   minLength: 3,
                                   maxLength: 30).getInput()

        let address = Input.Text(message: "Ingrese la dirección",
                                   errorMessage: "Dirección no válida",
                                   minLength: 3,
                                   maxLength: 30).getInput()

        let dni = Input.Text(message: "Ingrese el DNI del alumno",
                                   errorMessage: "DNI no válido",
                                   minLength: 8,
                                   maxLength: 8).getInput()

        let day = Input.Integer(message: "Ingrese el DÍA de nacimiento",
                                errorMessage: "Dato no válido",
                                range: 1...31).getInput()

        let month = Input.Integer(message: "Ingrese el mes de nacimiento",
                                  errorMessage: "Dato no válido",
                                  range: 1...12).getInput()

        let year = Input.Integer(message: "Ingrese el AÑO de nacimiento",
                                 errorMessage: "Dato no válido",
                                 range:1900...2022).getInput()

        return Student(name: firstName, lastName: lastName, address: address, dni: dni, birthdate: "\(day)/\(month)/\(year)")
    }

    static func getDNI() -> String {

        return Input.Text(message: "Ingrese el DNI del alumno",
                          errorMessage: "DNI no válido",
                          minLength: 8,
                          maxLength: 8).getInput()
    }

    func detail() {

        print("Fecha de nacimiento: \(self.birthdate)")
        print("Edad: \(self.age)")
        print("DNI: \(self.dni)")
        print("Nombre completo: \(self.fullName)")
        print("Dirección: \(self.address)")
        print("Iniciales: \(self.nameInitials) \n\n")
    }
}
