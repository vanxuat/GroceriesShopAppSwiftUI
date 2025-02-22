//
//  PaymentView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 6/10/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var paymentVm = PaymentViewModel.shared
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyHStack(spacing: 15) {
                    
                    ForEach(paymentVm.listArr, id: \.id) {
                        pObj in
                        HStack(spacing: 15) {
                            VStack {
                                HStack {
                                    Text("")
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                    frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Text("")
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primaryText)
                                        .padding(.horizontal, 8)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                                
                              
                            }
                            
                            VStack {
                                
                                Spacer()
                                
                                NavigationLink {
                                   
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.primary)
                                }
                                .padding(.bottom, 8)
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "close")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                    }
                }
            }
            
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                    }
                    
                   Spacer()
                    Text("Payment Method")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                    }
                    .foregroundColor(.primaryText)
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                .cornerRadius(5)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    PaymentMethodsView()
}
