//
//  HomeOption.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

enum HomeOption: Int {
    case none = 0
    case addStudent = 1
    case listStudent = 2
    case searchStudent = 3
    case deleteStudent = 4
    case exit = 5
    
    var scene: Scene? {
        
        switch self {
            case .addStudent: return AddStudentScene(title: "AGREGAR ALUMNO")
            case .listStudent: return ListStudentScene(title: "LISTADO DE ALUMNOS")
            case .searchStudent: return SearchStudentScene(title: "BUSCAR ALUMNO")
            case .deleteStudent: return DeleteStudentScene(title: "ELIMINAR ALUMNO")
            case .exit: return nil
            default: return nil
        }
    }
}
