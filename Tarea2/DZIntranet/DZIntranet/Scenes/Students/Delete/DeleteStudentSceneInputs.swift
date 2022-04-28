//
//  DeleteStudentSceneInputs.swift
//  DZIntranet
//
//  Created by Fernando Daniel on 27/04/22.
//

import Foundation

struct DeleteStudentSceneInputs {

    var documentTypeSelected: DocumentType = .none

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

    lazy var txtDeleteConfirmation: InputRequest = {

        let message = """
        Desea eliminar Alumno?
        (0) - No
        (1) - Si
        """

        return Input.Integer(message: message,
                             errorMessage: "El valor ingresado es incorrecto",
                             range: 0...1)
    }()
}
