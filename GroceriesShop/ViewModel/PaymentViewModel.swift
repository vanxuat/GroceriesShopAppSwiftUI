//
//  PaymentViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 6/10/24.
//

import SwiftUI

class PaymentViewModel: ObservableObject {
    static var shared: PaymentViewModel = PaymentViewModel()
    
    @Published var txtName: String = ""
    @Published var txtCardNumber: String = ""
    @Published var txtCardMonth: String = ""
    @Published var txtCardYear: String = ""
    
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [PaymentModel] = []
    @Published var total: Double = 0.0
 
    
    init() {
        
    }
    
    func clearAll(){
        txtName = ""
        txtCardNumber = ""
        txtCardMonth = ""
        txtCardYear = ""
      
    }
    
   
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_PAYMENT_METHOD_LIST,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                  
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return PaymentModel(dict: obj as? NSDictionary ?? [:])
                    })
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
    
    func serviceCallRemove(cObj: PaymentModel){
        ServiceCall.post(parameter: ["pay_id": cObj.id], path: Globs.SV_REMOVE_PAYMENT_METHOD,isToken: true) { responseObj in
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
    
    func serviceCallAdd(didDone:(()->())? ){
        
        if(txtName.isEmpty) {
            errorMessage = "please enter name"
            showError = true
            return
        }
        
        
        ServiceCall.post(parameter: ["name":txtName,"card_number": txtCardNumber,"card_month":txtCardMonth,"card_year": txtCardYear], path: Globs.SV_ADD_PAYMENT_METHOD,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
                } else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Faid"
                    self.showError = true
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
}
