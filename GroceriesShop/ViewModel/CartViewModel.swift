//
//  CartViewModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 22/9/24.
//

import Foundation
class CartViewModel : ObservableObject {
    static var shared: CartViewModel = CartViewModel()
    
   
    @Published var showError = false
    @Published var showOrderAccept = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [CartItemModel] = []
    @Published var total: Double = 0.0
    
    
    
 
    @Published var showCheckout: Bool = false
    
    @Published var showPickerAddress: Bool = false
    @Published var showPickerPayment: Bool = false
    @Published var showPickerPromoCode: Bool = false
    
    
    
    @Published var deliveryType: Int = 1
    
    @Published var paymentType: Int = 1
    @Published var deliverObj: AddressModel?
    @Published var paymentObj: PaymentModel?
    @Published var promoObj: PromoCodeModel?
    
    @Published var diliverPriceAmount: String?
    @Published var discountAmount: String?
    @Published var userPayAmount: String?
    
    init() {
        
    }
    
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.total = response.value(forKey: "total") as? Double ?? 0.0
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return CartItemModel(dict: obj as? NSDictionary ?? [:])
                    })
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallRemove(cObj: CartItemModel){
        ServiceCall.post(parameter: ["cart_id":cObj.id, "prod_id": cObj.prodId], path: Globs.SV_REMOVE_CART,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.serviceCallList()
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallUpdate(cObj: CartItemModel, newQTy: Int ){
        ServiceCall.post(parameter: ["cart_id":cObj.id, "prod_id": cObj.prodId,"new_qty": newQTy], path: Globs.SV_UPDATE_CART,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    self.serviceCallList()
                } else {
                   
                }
            }
        } failure: { error in
          
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    class func serviceCallAddToCart(prodId: Int, qty: Int,didDone: ((_ isdone: Bool,_ message: String)-> ())?) {
        ServiceCall.post(parameter: ["prod_id":prodId,"qty": qty], path: Globs.SV_ADD_CART,isToken: true) { responseObj in
            if let  response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1"  {
                    didDone?(true, response.value(forKey: KKey.message)  as? String ?? "Done")
                } else {
                    didDone?(false, response.value(forKey: KKey.message)  as? String ?? "Fail")
                }
            }
        } failure: { error in
          
        }
    }
}
