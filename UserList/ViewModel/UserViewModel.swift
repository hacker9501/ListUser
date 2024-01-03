//
//  UserViewModel.swift
//  UserList
//
//  Created by Elver Mayta Hernández on 3/01/24.
//

import Foundation

class UserViewModel: ObservableObject{
    
    @Published var user: [UserModel]?
    @Published var userError: UserError?
    @Published var shoAlert = false
    @Published var isloading = false
    
    func getUser() async{
        isloading = true
        do{
            self.user = try await Webservice.userList()
            isloading = false
        }catch(let error){
            userError = UserError.custom(error: error)
            shoAlert = true
            isloading = false
        }
    }
}
