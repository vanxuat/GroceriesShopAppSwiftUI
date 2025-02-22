//
//  PromoCodeViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 5/10/24.
//

import Foundation
class PromoCodeViewModel : ObservableObject {
    static var shared: PromoCodeViewModel = PromoCodeViewModel()
    
 
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [PromoCodeModel] = []
    @Published var total: Double = 0.0
 
    
    init() {
        serviceCallList()
    }
    
    func clearAll(){
       
    }
    
    func setData(aObj: PromoCodeModel ){
      
    }
    
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_ADDRESS_LIST,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                  
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return PromoCodeModel(dict: obj as? NSDictionary ?? [:])
                    })
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
}
