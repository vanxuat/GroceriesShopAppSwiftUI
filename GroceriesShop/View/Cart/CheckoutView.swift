//
//  CheckoutView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 6/10/24.
//

import SwiftUI

struct CheckoutView: View {
    
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var cartVM = CartViewModel.shared
    @Binding  var isShow: Bool
    
    
    var body: some View {
        VStack {
            HStack{
              
                Text("Checkout")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(height: 46)
                Spacer()
                
                Button {
                    $isShow.wrappedValue = false
                } label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
            }
            .padding(.top, 30)
            
            Divider()
            
            VStack{
                HStack {
                    Text("Delivery Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Picker("", selection: $cartVM.deliveryType) {
                        Text("Delivery").tag(1)
                        Text("Collection").tag(2)
                    }.pickerStyle(.segmented)
                        .frame(width: 180)
                }
                
                Divider()
                
                if(cartVM.deliveryType == 1) {
                    
                    NavigationLink {
                        DelieryAddressView(isPicker: true, didSelect: { aObj in
                            cartVM.deliverObj = aObj
                        })
                    }label: {
                        HStack {
                            Text("Delivery Type")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.secondaryText)
                                .frame(height: 46)
                            
                            Spacer()
                            
                            Text(cartVM.deliverObj?.name ?? "Select Method")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primaryText)
                        }
                    }
                    Divider()
                }
                
                HStack {
                    Text("Payment Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Picker("", selection: $cartVM.paymentType) {
                        Text("COD").tag(1)
                        Text("Online").tag(2)
                    }.pickerStyle(.segmented)
                        .frame(width: 180)
                }
                Divider()
                if(cartVM.paymentType == 2){
                    
                    NavigationLink {
                       // PaymentMethodsView(mode: , paymentVm: <#T##arg#>)
                        
                    }  label: {
                        HStack {
                            Text("Payment")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.secondaryText)
                                .frame(height: 46)
                            
                            Spacer()
                            
                            Image("master")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 20)
                            
                            Text("Select")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primaryText)
                        }
                    }
                    
                    
                    
                    Divider()
                }
               
                
                HStack {
                    Text("Promo Code")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("Pick Discount")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryText)
                }
                Divider()
            }
            
            VStack {
                HStack {
                    Text("Totat")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                    
                    
                    Spacer()
                    
                    Text("$ 4.98")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        
                }
                
                
                HStack {
                    Text("Delivery Cost")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                       
                    
                    Spacer()
                    
                    Text("$ 4.98")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                       
                }
                
                HStack {
                    Text("Discount")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                       
                    
                    Spacer()
                    
                    Text("$ 4.98")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.red)
                    
                       
                }
                Divider()
            }
            .padding(.horizontal,20)
            
            VStack {
                Text("By continue you agree to our")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Term of service")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryApp)
                    
                    Text(" and ")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryApp)
                    
                    
                    Text("Privacy Policy")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryApp)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                }
                .padding(.bottom, .screenWidth * 0.1)
            }
           
            
            RoundButton(title: "Place Order"){
                
            }
            .padding(.bottom, .bottomInsets + 15)
            
            
            
        }
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(20, corner: [.topLeft,.topRight])
    }
}

#Preview {
    Preview()
}


struct Preview: View {
    @State var isShow: Bool = false
    
    var body: some View {
        CheckoutView(isShow: $isShow)
    }
}
