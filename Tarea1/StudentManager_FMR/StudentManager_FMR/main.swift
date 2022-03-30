//
//  main.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 28/03/22.
//

import Foundation

var option: MenuOption
let menu = Menu()
let inputManager = InputManager()
var studentManager = StudentManager()

repeat {
    menu.show()

    let value = inputManager.getIntWith("Ingrese la opción:",
                                        errorMessage: "La opción es incorrecta",
                                        withRange: 1...5)
    option = MenuOption(rawValue: value) ?? .none

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
