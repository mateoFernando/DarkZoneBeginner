//
//  StudentsDataSource.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

protocol StudentsDataSourceProtocol {
    
    static var shared: StudentsDataSourceProtocol { get set }
    
    func insert(_ student: Student)
    func delete(_ student: Student)
    func getAll() -> [Student]
    func getAllSortedByFullName() -> [Student]
    func searchByKey(_ searchKey: String) -> Student?
}

class Students: StudentsDataSourceProtocol {
    
    static var shared: StudentsDataSourceProtocol = Students()
    
    private var data = [
        Student(name: "Kenyi", lastName: "Rodriguez", address: "Calle sin fin 666", document: Student.Document(type: .dni, number: "87654321")),
        Student(name: "Fernando", lastName: "Mateo", address: "Calle los olvidados", document: Student.Document(type: .dni, number: "67854321")),
        Student(name: "Daniel", lastName: "Garcia", address: "Calle los charros", document: Student.Document(type: .ce, number: "4567890123"))
    ]
    
    func insert(_ student: Student) {
        self.data.append(student)
    }
    
    func getAll() -> [Student] {
        self.data
    }
    
    func getAllSortedByFullName() -> [Student] {
        self.data.sorted(by: { $0.fullName < $1.fullName })
    }
    
    func searchByKey(_ searchKey: String) -> Student? {
        return self.data.first { student in
            
            let textToSearch = searchKey.lowercased()
            let fullName = student.fullName.lowercased()
            let document = student.document.number.lowercased()
            
            return document.contains(textToSearch) || fullName.contains(textToSearch)
        }
    }

    func delete(_ student: Student) {
        self.data = self.data.filter { $0.document.number != student.document.number }
    }
    
//    mutating func getAllSortedByFullName() -> [Student] {
//        return self.data.sorted { studentA, studentB in
//            return studentA.fullName < studentB.fullName
//        }
//    }
}
