//
//  ExploreItemViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 22/9/24.
//

import Foundation

class ExploreItemViewModel : ObservableObject {
    
    
    @Published var pObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    init(catObj: ExploreCategoryModel) {
        self.pObj = catObj
       
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: ["prod_id":self.pObj.id], path: Globs.SV_PRODUCT_DETAIL,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
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
