//
//  HomeViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 16/9/24.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
    
    init() {
        
    }
    
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.offerArr = (payloadObj.value(forKey: "offer_list")as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.bestArr = (payloadObj.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.listArr = (payloadObj.value(forKey: "list") as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.typeArr = (payloadObj.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                            return TypeModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        
                        
                        
                    }
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
}
