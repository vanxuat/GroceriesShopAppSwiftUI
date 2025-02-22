//
//  ProductModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import Foundation

class ProductModel : Identifiable, Equatable {
    
    var id: Int = 0
    var prodId: Int = 0
    var catId: Int = 0
    var brandId: Int = 0
    var typeId: Int = 0
    var detail: String = ""
    var name: String = ""
    
    var unitName: String = ""
    var unitValue: String = ""
    var nutritionWeight: String = ""
    var image: String = ""
    var catName: String = ""
    var typeName: String = ""
    var authToken: String = ""
    var offerPrice:  Double?
    var price:  Double = 0
    var startDate: Date = Date()
    var endDate: Date =  Date()
    var isFav: Bool = false
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "prod_id") as? Int ?? 0
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.detail = dict.value(forKey: "detail") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.isFav = dict.value(forKey: "is_fav") as? Int ?? 0 == 1
        self.unitName = dict.value(forKey: "unit_name") as? String ?? ""
        self.unitValue = dict.value(forKey: "unit_value") as? String ?? ""
        self.nutritionWeight = dict.value(forKey: "nutrition_weight") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.catName = dict.value(forKey: "cat_name") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.authToken = dict.value(forKey: "auth_token") as? String ?? ""
        self.offerPrice = dict.value(forKey: "offer_price") as? Double
        self.startDate = (dict.value(forKey: "start_date") as? String ?? "").stringDateToDate() ?? Date()
        self.endDate = (dict.value(forKey: "end_date") as? String ?? "").stringDateToDate() ?? Date()
        
    }
    
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}
