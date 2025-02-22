//
//  CartItemRow.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 24/9/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    var body: some View {
        VStack {
            HStack(spacing: 15) {
//                WebImage(url: URL(string: cObj.image)) // Su dung khi co mang
//                  .resizable()
//                  .indicator(.activity) // Activity Indicator
//                  .transition(.fade(duration: 0.5)) // Fade Transition with duration
//                  .scaledToFit()
//                  .frame(width: 60,height: 60)
                
                Image("banana")
                    .resizable()
                     .scaledToFit()
                     .frame(width: 60,height: 60)
                
                VStack(spacing: 4) {
                    HStack {
                        Text("qua choi ngon")//cObj.name
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                        
                        Button(action: {
                            CartViewModel.shared.serviceCallUpdate(cObj: cObj, newQTy: cObj.qty - 1)
                        }, label: {
                           Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        })
                        
                    }
                    Text("\(cObj.unitValue)\(cObj.unitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,8)
                    
                    HStack{
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdate(cObj: cObj, newQTy: cObj.qty + 1)
                        }label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                                .padding(10)
                        }
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5),lineWidth: 1)
                        }
                        
                        Text("\(cObj.qty)")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45,height: 45, alignment: .center)
                            
                        
                        Button {
                          
                        }label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                                .padding(10)
                        }
                        .padding(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.placeholder.opacity(0.5),lineWidth: 1)
                        }
                        
                        
                        
                        
                        Spacer()
                        Text("\(cObj.offerPrice ?? cObj.price, specifier: "%.2f" )")
                            .font(.customfont(.semibold, fontSize: 20))
                            .foregroundColor(.primaryText)
                    }
                  
                    
                }
                
             
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    
            }
            Spacer()
        }
    }
}

#Preview {
    CartItemRow()
}
