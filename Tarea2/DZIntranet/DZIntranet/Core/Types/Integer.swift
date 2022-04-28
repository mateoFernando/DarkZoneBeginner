//
//  Integer.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

extension Input {
    struct Integer: InputRequest {
        let message: String
        let errorMessage: String
        let range: ClosedRange<Int>
        
        func validate(_ inputValue: String) -> Bool {
            guard let value = Int(inputValue) else { return false }
            return self.range.contains(value)
        }
        
        func showErrorMessage() {
            print("""
            
            ⚠️ ERROR: \(self.errorMessage)
            El valor ingresado deberá estar entre \(range.min() ?? 0) y \(range.max() ?? 0)
            Presione Enter para continuar ↩️
            
            """)
            let _ = readLine()
        }
    }
}
