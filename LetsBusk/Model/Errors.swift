//
//  Errors.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation

enum Errors: Error, LocalizedError, Identifiable {
    case invalidCredentials
    case shortPassword
    case isTaken
    case unknownError
    case badEmail
    
    var id: String {
        self.localizedDescription
    }
    
    var errorDescription: String? {
        switch self {
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password are incorrect. Please try again.", comment: "")
            case .shortPassword:
                return NSLocalizedString("Password is too short. Please try again.", comment: "")
            case .isTaken:
                return NSLocalizedString("Email is taken. Please try again.", comment: "")
            case .unknownError:
                return NSLocalizedString("Unknown error, please try again or restart the application.", comment: "")
            case .badEmail:
                return NSLocalizedString("Email is in wrong format.", comment: "")
            
        }
    }
}
