//
//  InputValidation.swift
//  InputValidation
//
//  Created by Gaurang on 17/02/22.
//

import Foundation

typealias ValidationResult = (isValid: Bool, error: String?)

enum InputValidation {
    case nonEmpty
    case synopsis
    case price
}

extension InputValidation {

    var maxLimit: Int {
        switch self {
        case .synopsis:
            return 10
        default:
            return 100
        }
    }

    var pattern: String {
        switch self {
        case .price:
            return "^[0-9]+$"
        default:
            return ""
        }
    }

    func isValid(input: String, field: String) -> ValidationResult {
        switch self {
        case .price:
            return validatePrice(input: input, field: field)
        case .synopsis:
            return validateNoEmpty(input: input, field: field)
        case .nonEmpty:
            return validateNoEmpty(input: input, field: field)
        }
    }

    func isValidForPattern(input: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", self.pattern)
        return predicate.evaluate(with: input)
    }

}

// MARK: - Validation Methods
extension InputValidation {

    // MARK: - None Empty
    func validateNoEmpty(input: String, field: String) -> ValidationResult {
        if input.isEmpty {
            return (false, "\(Messages.pleaseEnter) \(field)")
        } else {
            return (true, nil)
        }
    }

    // MARK: - Price
    func validatePrice(input: String, field: String) -> ValidationResult {
        let emptyValidation = validateNoEmpty(input: input, field: field)
        guard emptyValidation.isValid else {
            return emptyValidation
        }
        guard isValidForPattern(input: input) else {
            return (false, "\(Messages.pleaseEnterValid) \(field)")
        }
        return (true, "")
    }
}
