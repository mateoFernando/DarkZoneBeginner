//
//  InputManager.swift
//  Ejercicio01
//
//  Created by Kenyi Rodriguez on 24/03/22.
//

import Foundation

struct Input { }

protocol InputRequest {
    var message: String { get }
    var errorMessage: String { get }
    func validate(_ inputValue: String) -> Bool
    func showErrorMessage()
}

extension InputRequest {
    
    func getInput() -> String {
        
        self.showMessage()
        let inputValue = readLine() ?? ""
        if self.validate(inputValue) {
            return inputValue
        } else {
            self.showErrorMessage()
            return self.getInput()
        }
    }
    
    func showErrorMessage() {
        print("""
        
        ⚠️ ERROR: \(self.errorMessage)
        Presione Enter para continuar ↩️
        
        """)
        let _ = readLine()
    }
    
    func showMessage() {
        print("\n\n~ ✅ ~ \(self.message):")
    }
}
