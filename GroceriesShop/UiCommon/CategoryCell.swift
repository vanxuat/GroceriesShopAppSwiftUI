//
//  CategoryCell.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var tObj: TypeModel = TypeModel(dict: [:])
    @State var color: Color = Color.yellow
    var didAddCart: (()->())?
    var body: some View {
        HStack {
            
            
            // su dung cai nay khi goi api
//            WebImage(url: URL(string:tObj.image))
//              .resizable()
//              .indicator(.activity) // Activity Indicator
//              .transition(.fade(duration: 0.5)) // Fade Transition with duration
//              .scaledToFit()
//              .frame(width: 70,height: 70)
            
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 70,height: 70)
            
            Text("Banana")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .frame(width: 250,height: 100)
        .background(color.opacity(0.3))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCell()
}
