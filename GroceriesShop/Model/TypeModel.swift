//
//  TypeModel.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import SwiftUI

struct TypeModel : Identifiable, Equatable {
    
    var id: Int = 0
    var typeName: String
    var image: String
    var color: Color = Color.primaryApp
    
    init(dict: NSDictionary ) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.typeName = dict.value(forKey: "username") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
    }
    
    
    
    static func == (lhs: TypeModel, rhs: TypeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
