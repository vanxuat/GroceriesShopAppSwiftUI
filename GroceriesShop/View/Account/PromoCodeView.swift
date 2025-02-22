//
//  PromoCodeView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 5/10/24.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var promoVM = PromoCodeViewModel.shared
    
    var didSelect: ((_ obj: AddressModel) -> ())?
    @State var isPicker: Bool = false
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach(promoVM.listArr,id: \.id) { pObj in
                        VStack {
                            HStack {
                                Text("\(pObj.type)")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                
                                Text(pObj.code)
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.primaryText)
                                    .padding(.horizontal, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Text(pObj.description)
                                .font(.customfont(.medium, fontSize: 14))
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            
                            HStack{
                                Text("Expiry Date:")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .padding(.vertical, 8)
                                
                                Text(pObj.endDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                          
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                    }
                }
            }
        }
    }
}

#Preview {
    PromoCodeView()
}
