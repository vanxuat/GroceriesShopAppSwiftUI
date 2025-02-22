//
//  OrderAcceptView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 14/10/24.
//

import SwiftUI

struct OrderAcceptView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            VStack {
                Spacer()
                Image("order_accpeted")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.7)
                    .padding(.bottom, 12)
                
                Text("Your order has been \n accepted")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 28))
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 12)
                
                Text("Your items has been placed and is on\nit's way to being prescessed")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, 12)
                
                Spacer()
                
                
                RoundButton(title: "Track Order") {
                    
                }
                
                Button {
                    
                } label: {
                    Text("Back to home")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .padding(.vertical,15)
                }
                .padding(.bottom, .bottomInsets + 15)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    OrderAcceptView()
}
