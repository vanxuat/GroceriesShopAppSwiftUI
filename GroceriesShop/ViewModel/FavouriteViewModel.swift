//
//  FavouriteViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import Foundation
class FavouriteViewModel : ObservableObject {
    static var share: FavouriteViewModel = FavouriteViewModel()
    
    @Published var showError  = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    func serviceCallDatailList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
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
    
}
