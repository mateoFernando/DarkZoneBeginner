//
//  HomeSceneInputs.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

struct HomeSceneInputs {
    
    lazy var txtMenu: Input.Integer = {
        let message = """
        
        Seleccione una opción del menú:
        
        (1) - Agregar Nuevo Alumno
        (2) - Listar Todos los Alumnos
        (3) - Buscar un Alumno por nombre
        (4) - Eliminar Alumno
        (5) - Salir
        
        """
        
        let errorMessage = "Opción no válida"
        
        return Input.Integer(message: message,
                             errorMessage: errorMessage,
                             range: 1...5)
    }()
}
