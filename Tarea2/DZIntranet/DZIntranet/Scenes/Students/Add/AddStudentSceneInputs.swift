//
//  AddStudentSceneInputs.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

struct AddStudentSceneInputs {

    var documentTypeSelected: DocumentType = .none
    
    let txtName: InputRequest = Input.Text(message: "Ingrese el nombre del Alumno",
                                                errorMessage: "El nombre ingresado es incorrecto",
                                                minLength: 3)
    
    let txtLastName: InputRequest = Input.Text(message: "Ingrese el apellido del Alumno",
                                               errorMessage: "El apellido ingresado es incorrecto",
                                               minLength: 3)
    
    let txtAddress: InputRequest = Input.Text(message: "Ingrese la dirección del Alumno",
                                              errorMessage: "La dirección ingresada es incorrecta",
                                              minLength: 3)
    
    lazy var txtDocumentType: InputRequest = {
        
        let message = """
        Ingrese Tipo de documento
        (1) - DNI
        (2) - Carnet de extranjería
        (3) - Passaporte
        (0) - Cualquier otro documento no presente en la lista
        """
        
        return Input.Integer(message: message,
                             errorMessage: "El valor ingresado es incorrecto",
                             range: 0...3)
    }()
    
    lazy var txtDocumentNumber: Input.Text = {
        let documentoInformation = self.documentTypeSelected.information
        return Input.Text(message: "Ingrese el número de su \(documentoInformation.name)",
                          errorMessage: "El número de documento es inválido",
                          minLength: Int(documentoInformation.rangeLength.min() ?? 0),
                          maxLength: Int(documentoInformation.rangeLength.max() ?? 0))
    }()
}
