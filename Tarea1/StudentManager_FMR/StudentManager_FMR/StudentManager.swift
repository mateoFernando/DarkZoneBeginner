//
//  StudentManager.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 29/03/22.
//

import Foundation

struct StudentManager {

    var students: [Student] = []
    
    mutating func addStudent() {
        print("\n\n***** Agregando alumno *****\n\n")

        let name = inputManager.getStringWith("Ingrese el nombre",
                                              errorMessage: "Nombre no válido")
        let lastName = inputManager.getStringWith("Ingrese el apellido",
                                                  errorMessage: "Apellido no válido")
        let address  = inputManager.getStringWith("Ingrese la dirección",
                                                  errorMessage: "Dirección no válida")
        let dni = getDNIString()
        let day = inputManager.getIntWith("Ingrese el DÍA de nacimiento",
                                          errorMessage: "Dato no válido",
                                          withRange: 1...31)
        let month = inputManager.getIntWith("Ingrese el MES de nacimiento",
                                            errorMessage: "Dato no válido",
                                            withRange: 1...12)
        let year = inputManager.getIntWith("Ingrese el AÑO de nacimiento",
                                           errorMessage: "Dato no válido",
                                           withRange: 1900...2022)

        students.append(Student(name: name,
                                   lastName: lastName,
                                   address: address,
                                   dni: dni,
                                   birthdate: "\(day)/\(month)/\(year)"))

        print("\n\n!\(name) se agrego correctamente!\n\n")
    }

    func listStudents() {
        print("\n\n***** Lista de alumnos *****\n\n")
        guard !students.isEmpty else {
            print("\n\n No cuentas con alumnos \n\n")
            return
        }
//        let sortedStudents = arrStudents.sorted(by: { $0.lastName < $1.lastName })
        let sortedStudents = sortNames(students)
        for (i, student) in sortedStudents.enumerated() {
            print("\(i+1). \(student.nameInitials) - \(student.fullName)")
        }
    }

    func searchStudent() {
        print("\n\n***** Buscando alumnos *****\n\n")

        let dni = getDNIString()
        guard let student = getStudentWith(dni: dni) else {
            print("No se encontró alumno con DNI: \(dni)")
            return
        }

        print("\n\n Alumno con \(dni) encontrado: \n\n")
        print("Fecha de nacimiento: \(student.birthdate)")
        print("Edad: \(student.age)")
        print("DNI: \(student.dni)")
        print("Nombre completo: \(student.fullName)")
        print("Dirección: \(student.address)")
        print("Iniciales: \(student.nameInitials) \n\n")
    }

    mutating func deleteStudent() {
        print("\n***** Eliminando alumno *****\n")
        guard !students.isEmpty else {
            print("No cuentas con alumnos registrados")
            return
        }

        let dni = getDNIString()
        guard let index = getStudentIndexWith(dni: dni) else {
            print("No se encontró alumno con DNI: \(dni)")
            return
        }

        let respuesta = inputManager.getIntWith("\n¿Quieres eliminar al alumuno con DNI \(dni)?\n1.Si\n2.No\n\n",
                                                errorMessage: "Opción no válida",
                                                withRange: 1...2)
        guard let option = DeleteOption(rawValue: respuesta) else { return }
        switch option {
            case .yes:
                removeStudentFromArrayWith(index: index)
                print("¡\n\n***** Alumno eliminado *****\n\n")
            case .no:
                print("\n\nRegresando al menu principal\n\n")
        }
    }

    private mutating func removeStudentFromArrayWith(index: Int) {
        students.remove(at: index)
    }

    private func getStudentWith(dni: String) -> Student? {
        guard let index = getStudentIndexWith(dni: dni) else { return nil }
        return students[index]
    }

    private func getStudentIndexWith(dni: String) -> Int? {
        return students.firstIndex(where: { $0.dni == dni })
    }

    private func getDNIString() -> String {
        #warning("Validar que no se repita el DNI")
        return inputManager.getStringWith("Ingrese el DNI del alumno",
                                          errorMessage: "DNI no válido",
                                          withRange: 8...8)
    }

    func sortNames(_ list: [Student]) -> [Student] {
        var array = list
        var swap = false
        for firstIndex in 0..<array.count-1 {
            swap = false
            for index in 0..<array.count-firstIndex-1 {
                if array[index].fullName > array[index+1].fullName {
                    let aux = array[index]
                    array[index] = array[index+1]
                    array[index+1] = aux
                    swap = true
                }
            }
            if swap == false {
                break
            }
        }
        return array
    }
}


