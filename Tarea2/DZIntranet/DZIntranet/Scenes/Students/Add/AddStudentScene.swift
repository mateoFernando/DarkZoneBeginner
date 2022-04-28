//
//  AddStudentScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

class AddStudentScene: Scene {
    
    lazy var input = AddStudentSceneInputs()
    var data: StudentsDataSourceProtocol!
    
    override func drawView() {
        super.drawView()

        let name = self.input.txtName.getInput()
        let lastName = self.input.txtLastName.getInput()
        let address = self.input.txtAddress.getInput()
        
        let documentTypeValue = self.input.txtDocumentType.getInput()
        let documentType = DocumentType(rawValue: Int(documentTypeValue) ?? 0) ?? .none
        self.input.documentTypeSelected = documentType
        
        let documentNumber = self.input.txtDocumentNumber.getInput()
        
        let student = Student(name: name,
                              lastName: lastName,
                              address: address,
                              document: Student.Document(type: documentType, number: documentNumber))
        
        data.insert(student)
        self.backScene()
    }
}
