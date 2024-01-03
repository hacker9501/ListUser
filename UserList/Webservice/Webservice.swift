//
//  Webservice.swift
//  UserList
//
//  Created by Elver Mayta Hernández on 3/01/24.
//

import Foundation

final class Webservice{
    
    static func userList() async throws -> [UserModel]{
        let api = "https://api.github.com/users"
        guard let url = URL(string: api) else{
            throw UserError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw UserError.incalidResponse
        }
        guard let user = try? JSONDecoder().decode([UserModel].self, from: data) else{
            throw UserError.invalidData
        }
        print(user)
        return user
//        do{
//            let decoder = JSONDecoder()
//            return try decoder.decode([UserModel].self, from: data)
//            print(data)
//        }catch{
//            throw UserError.invalidData
//        }
    }
}
