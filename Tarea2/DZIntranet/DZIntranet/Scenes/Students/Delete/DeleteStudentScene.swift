//
//  DeleteStudentScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

class DeleteStudentScene: Scene {

    var inputs = DeleteStudentSceneInputs()
    var data: StudentsDataSourceProtocol!

    override func drawView() {
        super.drawView()
        data = Students.shared
        self.getDocumentNumber()
    }

    private func getDocumentNumber() {

        if data.getAll().count > 0 {
            let documentTypeValue = self.inputs.txtDocumentType.getInput()
            let documentType = DocumentType(rawValue: Int(documentTypeValue) ?? 0) ?? .none
            self.inputs.documentTypeSelected = documentType

            let documentNumber = self.inputs.txtDocumentNumber.getInput()

            guard let student = Students.shared.searchByKey(documentNumber) else {
                print("\nNo se encontraron resultado para: \(documentNumber)")
                _ = readLine()
                self.backScene()
                return
            }
            self.deleteStudent(student)
        } else {
            print("\n ⚠️ No se encontraron estudiantes ⚠️")
            self.backScene()
        }
    }

    private func deleteStudent(_ student: Student) {

        let confirmation = self.inputs.txtDeleteConfirmation.getInput()

        let shouldDelete = Int(confirmation) ?? 0

        if shouldDelete == 0 { self.backScene() } else {
            self.data.delete(student)
            print("\n ❗️Usuario eliminado con exito❗️")
            self.backScene()
        }
    }
}
