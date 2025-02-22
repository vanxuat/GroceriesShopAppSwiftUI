//
//  ExploreViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 22/9/24.
//

import Foundation
class ExploreViewModel : ObservableObject {
    static var shared:ExploreViewModel = ExploreViewModel()
    @Published var showError  = false
    @Published var textSearch: String = ""
    @Published var errorMessage = ""
    @Published var listArr: [ExploreCategoryModel] = []
    
    
    init(){
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_ADD_REMOVE_FAVORITE,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                  
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? [] ).map({ obj in
                        return ExploreCategoryModel(dict: obj as? NSDictionary ?? [:])
                    })
                 
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
                    self.showError = true
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
