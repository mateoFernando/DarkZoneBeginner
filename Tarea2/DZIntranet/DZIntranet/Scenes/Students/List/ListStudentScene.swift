//
//  ListStudentScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

class ListStudentScene: Scene {
    
    override func drawView() {
        super.drawView()
        self.drawList()
        self.backScene()
    }
    
    private func drawList() {
        
        let arrayStudents = Students.shared.getAllSortedByFullName()
        
        for student in arrayStudents {
            print(" |\(student.placeholder)| - \(student.fullName)")
        }
        
        print("\n")
    }
}
