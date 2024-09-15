//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 15/9/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    init(){
        #if DEBUG
            txtEmail = "van@gmail.com"
            txtPassword = "123"
        #endif
    }
    
    // MARK: ServiceCall
    
    func serviceCalllLogin(){
        
        if txtEmail.isEmpty {
            self.errorMessage = "please enter valid address"
            self.showError = true
            return
        }
        
        if !txtEmail.isValidEmail {
            self.errorMessage = "please enter valid address"
            self.showError = true
            return
        }
        
        if txtPassword.isEmpty {
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
        }
        
        
        ServiceCall.post(parameter: ["Email": txtEmail, "Password": txtPassword], path: Globs.SV_LOGIN) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    print(response)
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = false
                    
                } else {
                    print(response)
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }

    }
    
}

