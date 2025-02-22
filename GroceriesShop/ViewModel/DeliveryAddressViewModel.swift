//
//  DeliveryAddressViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 1/10/24.
//

import SwiftUI

class DeliveryAddressViewModel : ObservableObject {
    static var shared: DeliveryAddressViewModel = DeliveryAddressViewModel()
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtAddresss: String = ""
    @Published var txtCity: String = ""
    @Published var txtState: String = ""
    @Published var txtPostalCode: String = ""
    @Published var txtTypeName: String = "Home"
    
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [AddressModel] = []
    @Published var total: Double = 0.0
 
    
    init() {
        
    }
    
    func clearAll(){
        txtName = ""
        txtMobile = ""
        txtAddresss = ""
        txtCity = ""
        txtState = ""
        txtPostalCode = ""
        txtTypeName = "Home"
    }
    
    func setData(aObj: AddressModel ){
        txtName = aObj.name
        txtMobile = ""
        txtAddresss = ""
        txtCity = ""
        txtState = ""
        txtPostalCode = ""
        txtTypeName = "Home"
    }
    
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_ADDRESS_LIST,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                  
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return AddressModel(dict: obj as? NSDictionary ?? [:])
                    })
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallRemove(cObj: AddressModel){
        ServiceCall.post(parameter: ["address_id": cObj.id], path: Globs.SV_REMOVE_ADDRESS,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.serviceCallList()
                } else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func servicCallUpdateAddress(aObj: AddressModel?,didDone: (()-> ())?) {
        ServiceCall.post(parameter: ["address_id": aObj?.id ?? "", "name": txtName ,"type_name": txtTypeName,"phone": txtMobile, "address": txtAddresss, "city": txtCity, "state": txtState], path: Globs.SV_ADD_ADDRESS,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.clearAll()
                    didDone?()
                } else {
                
                }
            }
        } failure: { error in
          
        }
    }
    
    func serviceCallAddAddress(didDone: (()-> ())?) {
        ServiceCall.post(parameter: ["name": txtName ,"type_name": txtTypeName,"phone": txtMobile, "address": txtAddresss, "city": txtCity, "state": txtState], path: Globs.SV_ADD_ADDRESS,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.clearAll()
                    self.serviceCallList()
                } else {
                 
                }
            }
        } failure: { error in
          
        }
    }
}
