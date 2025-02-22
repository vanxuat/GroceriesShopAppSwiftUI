//
//  HomeView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 16/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVm = HomeViewModel.shared
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                       
                    
                    HStack {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16,height: 16)
                        
                        
                        Text("Dhaka, Banassre")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.darkGray)
                    }
                    SearchTextField(txt: $homeVm.txtSearch, placholder: "Search store")
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                }
                .padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 115)
                    .padding(.horizontal,20)
                
                SelectionTitleAll(title: "Exclusive offer",titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVm.offerArr,id: \.id) {
                            pObj in
                            ProductCell(pObj: pObj) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isdone, message in
                                    self.homeVm.errorMessage = message
                                    self.homeVm.showError = true
                                }
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                
                SelectionTitleAll(title: "Best Selling",titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVm.bestArr, id: \.id) {
                            pObj in
                            ProductCell(pObj: pObj) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isdone, message in
                                    self.homeVm.errorMessage = message
                                    self.homeVm.showError = true
                                }
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                
                SelectionTitleAll(title: "Groceries",titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVm.typeArr, id: \.id){ tObj in
                            CategoryCell(tObj: tObj) {
                                
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,8)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach(0...5,id: \.self) {
                            index in
                            ProductCell() {
                                
                            }
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                .padding(.bottom, .bottomInsets + 46)
                
            }
        }
        .alert(isPresented: $homeVm.showError) {
            Alert(title: Text(Globs.AppName),message: Text(homeVm.errorMessage),dismissButton: .default(Text("OK")))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
