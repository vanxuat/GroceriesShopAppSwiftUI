//
//  DelieryAddressView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 1/10/24.
//

import SwiftUI

struct DelieryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var addressVm = DeliveryAddressViewModel.shared
   
    @State var isPicker: Bool = false
    var didSelect: ((_ obj: AddressModel) -> ())?
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(addressVm.listArr,id: \.id) { aObj in
                        HStack(spacing: 15) {
                            VStack {
                                HStack {
                                    Text(aObj.name)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                    frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Text(aObj.typeName)
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primaryText)
                                        .padding(.horizontal, 8)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Text("\(aObj.address),\(aObj.city),\(aObj.postalCode)")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment(.leading)
                                frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(aObj.phone)
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                            }
                            
                            VStack {
                                
                                Spacer()
                                
                                NavigationLink {
                                    AddDeliveryAddressView(isEdit: true, editObj: aObj)
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
                        .onTapGesture {
                            if (isPicker) {
                                mode.wrappedValue.dismiss()
                                didSelect?(aObj)
                            }
                        }
                    }
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
          
            
            
           
        }
        .onAppear {
          
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        DelieryAddressView()
    }
   
}
