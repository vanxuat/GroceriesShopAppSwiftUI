//
//  SearchTextField.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 17/9/24.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var txt: String
    @State var placholder: String = "Placholder"
    
    var body: some View {
        HStack(spacing: 15) {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20,height: 20)
            TextField(placholder,text: $txt)
                .font(.customfont(.regular, fontSize: 16))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}
#Preview {
    // Create a separate view to hold the @State var for the preview
    SearchTextFieldWrapper()
}

struct SearchTextFieldWrapper: View {
    @State var txt: String = ""
    
    var body: some View {
        SearchTextField(txt: $txt)
            .padding(20)
    }
}
