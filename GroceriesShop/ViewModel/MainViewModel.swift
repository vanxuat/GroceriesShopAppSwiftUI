//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 15/9/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    @Published var txtUsername: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserModel = UserModel(dict: [:])
    
    init(){
        
        if Utils.UDValueBool(key: Globs.userLogin) {
            self.setUserData(uDict: Utils.UDValue(key: Globs.userPayload) as? NSDictionary ?? [:])
        } else {
            
        }
        
        #if DEBUG
            txtEmail = "van@gmail.com"
            txtPassword = "123"
        #endif
    }
    
    func Logout(){
        Utils.UDSET(data: false, key: Globs.userLogin)
        isUserLogin = false
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
                    self.setUserData(uDict:response.value(forKey: KKey.payload) as? NSDictionary ?? [:] )
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
    
    func serviceCallSignUp(){
        
        if txtUsername.isEmpty {
            self.errorMessage = "please enter valid username"
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
        
        
        ServiceCall.post(parameter: ["username": txtUsername,"Email": txtEmail, "Password": txtPassword], path: Globs.SV_SIGN_UP) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.setUserData(uDict:response.value(forKey: KKey.payload) as? NSDictionary ?? [:] )
                    
                    self.txtUsername = ""
                    self.txtEmail = ""
                    self.txtPassword = ""
                    self.isShowPassword = false
                    
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
    
    func setUserData(uDict: NSDictionary) {
      
        Utils.UDSET(data: uDict, key: Globs.userPayload)
        Utils.UDSET(data: true, key: Globs.userLogin)
        self.userObj  = UserModel(dict: uDict)
        self.isUserLogin = true
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
    }
    
}

