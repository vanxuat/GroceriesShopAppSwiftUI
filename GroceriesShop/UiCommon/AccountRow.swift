//
//  AccountRow.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 1/10/24.
//

import SwiftUI

struct AccountRow: View {
    @State var title: String = "Title"
    @State var icon: String = "a_order"
    var body: some View {
        VStack {
       
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                Text(title)
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height:15)
            }
            .padding(20)
            Divider()
        }
    }
}

#Preview {
    AccountRow()
}
