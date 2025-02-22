//
//  ExploreCategoryCell.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 22/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    var didAddCart: (()-> ())?
    var body: some View {
        VStack {
            WebImage(url: URL(string:""))
              .resizable()
              .indicator(.activity) // Activity Indicator
              .transition(.fade(duration: 0.5)) // Fade Transition with duration
              .scaledToFit()
              .frame(width: 120,height: 90)
            
            Spacer()
            
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding(15)
        .frame(height: 100)
        .background(Color.white.opacity(0.3))
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius:  16)
                .stroke(cObj.color,lineWidth: 1)
        }
    }
}

#Preview {
    ExploreCategoryCell()
}
