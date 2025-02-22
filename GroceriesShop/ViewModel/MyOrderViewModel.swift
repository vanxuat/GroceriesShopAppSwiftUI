//
//  MyOrderViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 14/10/24.
//

import Foundation
class MyOrderViewModel : ObservableObject {
    static var shared: MyOrderViewModel = MyOrderViewModel()
    
    
    @Published var listArr: [MyOrderModel] = []
    
    init() {
        
    }
}
