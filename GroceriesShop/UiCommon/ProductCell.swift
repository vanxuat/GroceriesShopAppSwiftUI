//
//  ProductCell.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width: Double = 180.0
    var didAddCart: (()->())?
    
    var body: some View {
        
        NavigationLink {
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: pObj))
        }label: {
            
            VStack{
                
                WebImage(url: URL(string:pObj.image))
                  .resizable()
                  .indicator(.activity) // Activity Indicator
                  .transition(.fade(duration: 0.5)) // Fade Transition with duration
                  .scaledToFit()
                  .frame(width: 100,height: 100)
                
              
                
                Spacer()
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                
                Text("\(pObj.unitValue)\(pObj.unitName), price")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                HStack {
                    Text("\(pObj.offerPrice ?? pObj.price, specifier: "%.2f" )")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        didAddCart?()
                    } label: {
                        Image("add")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                    }
                    .frame(width: 40,height: 40)
                    .background(Color.primaryApp)
                    .cornerRadius(15)
                }
                
            }
            .padding(15)
            .frame(width: width,height: 230)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
            }
        }
        
      
    }
}

#Preview {
    ProductCell()
}
