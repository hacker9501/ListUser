//
//  ErrorCases.swift
//  UserList
//
//  Created by Elver Mayta Hernández on 3/01/24.
//

import Foundation

enum UserError: LocalizedError{
    case invalidUrl
    case incalidResponse
    case invalidData
    case custom(error: Error)
    
    var errorDescription: String?{
        switch self{
        case .invalidUrl: return "invalid url"
        case .incalidResponse: return "invalid response"
        case .invalidData: return "invalid data"
        case .custom(let error): return error.localizedDescription
        }
    }
}
