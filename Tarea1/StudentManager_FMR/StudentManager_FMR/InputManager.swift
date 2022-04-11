//
//  InputManager.swift
//  StudentManager_FMR
//
//  Created by Fernando Daniel on 29/03/22.
//

import Foundation

//struct InputManager {
//
//    func getIntWith(_ message: String, errorMessage: String, withRange range: ClosedRange<Int>) -> Int {
//        var isCorrect = false
//        var number = 0
//        repeat {
//            if let value = Int(getStringWith(message, errorMessage: errorMessage)), range.contains(value) {
//                number = value
//                isCorrect = true
//            } else {
//                self.showErrorMessage(errorMessage)
//            }
//        } while !isCorrect
//        return number
//    }
//
//    func getStringWith(_ message: String, errorMessage: String, withRange range: ClosedRange<Int>? = nil) -> String {
//        var input = ""
//        var isCorrect = false
//        repeat {
//            print(message)
//            if let inputValue = readLine(), inputValue.count > 0 {
//                input = inputValue
//                isCorrect = range?.contains(inputValue.count) ?? true
//            }
//            if !isCorrect {
//                self.showErrorMessage(errorMessage)
//            }
//        } while !isCorrect
//        return input
//    }
//
//    private func showErrorMessage(_ errorMessage: String) {
//        let message = """
//
//
//        =============================================
//        ❗️ERROR❗️  - \(errorMessage)
//        =============================================
//
//
//        """
//        print(message)
//    }
//}

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
        print("~ ✅ ~ \(self.message):")
    }
}

struct Input { }

extension Input {

    struct Text: InputRequest {
        let message: String
        let errorMessage: String
        let minLength: Int
        var maxLength: Int = Int.max

        func validate(_ inputValue: String) -> Bool {
            (self.minLength...self.maxLength).contains(inputValue.count)
        }
    }
}

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
