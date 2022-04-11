//
//  StudentManager_v2.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 10/04/22.
//

import Foundation

struct StudentManager {

    var students: [Student] = []

    mutating func addStudent() {
        let student = Student.build()
        students.append(student)
        print("\n\n!\(student.name) se agrego correctamente!\n\n")
    }

    func listStudents() {
        print("\n\n***** Lista de alumnos *****\n\n")
        guard !students.isEmpty else {
            print("\n\n No cuentas con alumnos \n\n")
            return
        }
        let sortedStudents = sortNames(students)
        for (i, student) in sortedStudents.enumerated() {
            print("\(i+1). \(student.nameInitials) - \(student.fullName)")
        }
    }

    func searchStudent() {
        print("\n\n***** Buscando alumnos *****\n\n")
        let dni = Student.getDNI()
        guard let student = getStudentWith(dni: dni) else {
            print("No se encontró alumno con DNI: \(dni)")
            return
        }

        print("\n\n Alumno con \(dni) encontrado: \n\n")
        student.detail()
    }

    mutating func deleteStudent() {
        print("\n***** Eliminando alumno *****\n")
        guard !students.isEmpty else {
            print("No cuentas con alumnos registrados")
            return
        }

        let dni = Student.getDNI()
        guard let index = getStudentIndexWith(dni: dni) else {
            print("No se encontró alumno con DNI: \(dni)")
            return
        }

        let respuesta = Input.Integer(message:"\n¿Quieres eliminar al alumuno con DNI \(dni)?\n1.Si\n2.No\n\n",
                                      errorMessage: "Opción no válida",
                                      range:1...2).getInput()
        guard let option = DeleteOption(rawValue: Int(respuesta) ?? 2) else { return }
        switch option {
            case .yes:
                removeStudentFromArrayWith(index: index)
                print("¡\n\n***** Alumno eliminado *****\n\n")
            case .no:
                print("\n\nRegresando al menu principal\n\n")
        }
    }
}

extension StudentManager {

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
