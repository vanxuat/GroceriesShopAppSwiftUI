//
//  SelectionTitleAll.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import SwiftUI

struct SelectionTitleAll: View {
    @State var title:String = "Title"
    @State var titleAll: String = "View All"
    var didTap: (()->())?
    var body: some View {
        HStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
        }
        
    }
}

#Preview {
    SelectionTitleAll()
}
