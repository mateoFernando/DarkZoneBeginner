//
//  Text.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

extension Input {
    struct Text: InputRequest {
        let message: String
        let errorMessage: String
        let minLength: Int
        var maxLength: Int
        
        func validate(_ inputValue: String) -> Bool {
            (self.minLength...self.maxLength).contains(inputValue.count)
        }
        
        @discardableResult init(message: String, errorMessage: String = "", minLength: Int = 0, maxLength: Int = Int.max) {
            self.message = message
            self.errorMessage = errorMessage
            self.minLength = minLength
            self.maxLength = maxLength
        }
    }
}
