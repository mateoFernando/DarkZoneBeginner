//
//  SearchStudentScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

class SearchStudentScene: Scene {
    
    var inputs = SearchStudentSceneInputs()
    
    override func drawView() {
        super.drawView()
        self.getSearchKey()
    }
    
    private func getSearchKey() {
        let searchKey = self.inputs.txtSearch.getInput()
        guard let student = Students.shared.searchByKey(searchKey) else {
            print("\nNo se encontraron resultado para: \(searchKey)")
            _ = readLine()
            self.getSearchKey()
            return
        }
        
        self.showStudent(student)
        self.backScene()
    }
    
    private func showStudent(_ student: Student) {
        
        let content = """
        
        Nombre: \(student.name)
        Apellido: \(student.lastName)
        Dirección: \(student.address)
        \(student.document.type.information.name): \(student.document.number)
        
        """
        
        print(content)
    }
}
