//
//  ExploreItemsView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 22/9/24.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemVm = ExploreItemViewModel(catObj:ExploreCategoryModel(dict: [:]))
    
    var column = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 15)
    ]
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                    Text(itemVm.pObj.name)
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                    Button {
                    }label: {
                        Image("filter_ic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                }
               
                
                ScrollView {
                    LazyVGrid(columns: column,spacing: 15) {
                        ForEach(itemVm.listArr, id: \.id) {
                            pObj in
                            ProductCell(pObj: pObj,width: .infinity) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isdone, message in
                                    self.itemVm.errorMessage = message
                                    self.itemVm.showError = true
                                }
                            }
                        }
                    }
//                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
                
            }
            .padding(.top,.topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $itemVm.showError) {
            Alert(title: Text(Globs.AppName),message: Text(itemVm.errorMessage),dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreItemsView()
}
