//
//  AccountView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 28/9/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("u1")
                        .resizable()
                        .frame(width: 60,height: 60)
                        .cornerRadius(30)
                    
                    VStack {
                        HStack {
                            Text("Code For Any")
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.primaryApp)
                            
                            Spacer()
                        }
                        
                        Text("codefor@gmail.com")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .accentColor(.secondaryText)
                        
                    }
                  
                }
                .padding(.horizontal,20)
                .padding(.top,.topInsets)
                Divider()
                
                Spacer()
                
                ScrollView {
                    LazyVStack {
                        VStack {
                            AccountRow(title: "Orders",icon: "a_order")
                            AccountRow(title: "My Details",icon: "a_my_detail")
                            
                            NavigationLink {
                                
                            } label: {
                                AccountRow(title: "Delivery Address",icon: "a_delivery_address")
                            }
                            AccountRow(title: "Payment Methods",icon: "paymenth_methods")
                            
                            NavigationLink {
                                PromoCodeView()
                            }label: {
                                AccountRow(title: "Promo Code",icon: "a_promocode")
                            }
                            
                          
                        }
                        
                        VStack {
                            AccountRow(title: "Notifications",icon: "a_noitification")
                            AccountRow(title: "Help",icon: "a_help")
                            AccountRow(title: "About",icon: "a_about")
                        }
                        
                        Button {
                            MainViewModel.shared.Logout()
                        }label: {
                            ZStack {
                                Text("Logout")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment(.center)
                                
                                
                                HStack{
                                    Spacer()
                                    Image("logout")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20,height: 20)
                                        .padding(.trailing,20)
                                    
                                }
                            }
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity,minHeight: 60, maxHeight: 60)
                        .background(Color(hex: "F2F3F2"))
                        .cornerRadius(20)
                        .padding(.horizontal,20)
                        .padding(.bottom,15)
                    }
                }
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AccountView()
}
