//
//  HomeViewModel.swift
//  Elaborate
//
//  Created by Sam Cross on 10/22/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var homeModel = HomeModel()
    @Published var counter: Int = 0
    @Published var inpEmail: String = ""
    @Published var inpPassword: String = ""
    @Published var sheetVis: Bool = false
    @Published var passText = "Password must be longer than 8 characters and not contain any spaces"
    @Published var showPassText = false
    
    @Published var createEmail: String = ""
    @Published var createPass: String = ""
    
    func signIn(){
        
    }
    
    func createUser(){
        
        print(createPass)
        Task{
            do{
                let user = try await AuthenticationManager.shared.createUser(email: createEmail, password: createPass)
                //isSignedUp = true
            }
            catch{
                print("Sign Up Failed :(")
                //isSignedUp = false
            }
        }
    }
}
