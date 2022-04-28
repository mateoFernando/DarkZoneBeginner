//
//  SearchStudentSceneInputs.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

struct SearchStudentSceneInputs {
    
    lazy var txtSearch: Input.Text = {
        
        let message = """
                        
        Ingrese el dato por cual usted desea buscar al alumno, puede buscar por:
        
        (*) - DNI
        (*) - Nombre
        (*) - Apellido
        
        """
        
        return Input.Text(message: message,
                   errorMessage: "El dato de búsqueda es incorrecto",
                   minLength: 1)
    }()
}
