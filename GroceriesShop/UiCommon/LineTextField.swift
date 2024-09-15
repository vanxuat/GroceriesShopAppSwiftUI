//
//  LineTextFeild.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 15/9/24.
//

import SwiftUI

struct LineTextField: View {
    
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @State var keyboardType: UIKeyboardType?
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType ?? .default)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height:40 )
            
            
            Divider()
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool 
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            if !isShowPassword {
                
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height:40 )
                
            } else {
                SecureField(placholder, text: $txt)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height:40 )
            }
            
            
            Divider()
        }
    }
}

#Preview {
    // Create a separate view to hold the @State var for the preview
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State var txt: String = ""
    
    var body: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
