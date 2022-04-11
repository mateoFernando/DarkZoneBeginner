//
//  main.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 28/03/22.
//

import Foundation

var option: MenuOption
let menu = Menu()
var studentManager = StudentManager()

repeat {
    menu.show()

    let value = Input.Integer(message:"Ingrese la opción:",
                              errorMessage: "La opción es incorrecta",
                              range: 1...5).getInput()
    option = MenuOption(rawValue: Int(value) ?? 0) ?? .none

    switch option {
        case .none:
            break
        case .add:
        studentManager.addStudent()
        case .list:
        studentManager.listStudents()
        case .search:
        studentManager.searchStudent()
        case .delete:
        studentManager.deleteStudent()
        case .exit:
        let exiteMessage = """


        ============================================
            MUCHAS GRACIAS POR ENTRAR A DARKZONE
        ============================================


        """
            print(exiteMessage)
    }
    let _ = readLine()
} while option != .exit
