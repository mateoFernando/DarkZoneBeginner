//
//  Decimal.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

extension Input {
    struct Decimal: InputRequest {
        let message: String //*
        let errorMessage: String //*
        let range: ClosedRange<Double>
        
        func validate(_ inputValue: String) -> Bool { //*
            guard let value = Double(inputValue) else { return false }
            return self.range.contains(value)
        }
        
        func showErrorMessage() {
            print("""
            
            ⚠️ ERROR: \(self.errorMessage)
            El valor ingresado deberá estar entre \(self.range.lowerBound) y \(self.range.upperBound)
            Presione Enter para continuar ↩️
            
            """)
            let _ = readLine()
        }
    }
}
