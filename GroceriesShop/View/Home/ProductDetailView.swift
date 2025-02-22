//
//  ProductDetailView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 21/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var  detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]))
    
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(hex: "F2F2F2"))
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft,.bottomRight])
                    
                    Image("banana")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                    
//                    WebImage(url: URL(string:detailVM.pObj.image))
//                      .resizable()
//                      .indicator(.activity) // Activity Indicator
//                      .transition(.fade(duration: 0.5)) // Fade Transition with duration
//                      .scaledToFit()
//                      .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack {
                    HStack {
                        Text("Organic Banana")//detailVM.pObj.name
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    
                        Button {
//                            detailVM.isFav = !detailVM.isFav
                            detailVM.serviceCallAddRemoveFav()
                        }label: {
                            Image(detailVM.isFav ? "favorite" : "fav")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)
                    }
                    
                    Text("7pcs, price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    
                    HStack {
                        
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        }label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                                .padding(10)
                        }
                        
                        Text("\(detailVM.qty)")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45,height: 45, alignment: .center)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5),lineWidth: 1)
                            }
                        
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        }label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                                .padding(10)
                        }
                        
                        
                        
                        
                        Spacer()
                        Text("$\(2.494,specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical, 8)
                    Divider()
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack {
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                        }label: {
                            Image(detailVM.isShowDetail ? "detail_open" : "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.secondaryText)
                    }
                    
                    if detailVM.isShowDetail {
                        Text("Bananas provide about 3 grams of fiber, which is important for promoting regular bowel movements and preventing constipation. The fiber in bananas also helps feed beneficial gut bacteria, improving overall")
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    Divider()
                }
                .padding(.horizontal, 20)
              
                
                VStack {
                    HStack {
                        Text("Nutritiions")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        Text("200g") //detailVM.pObj.nutritionWeight
                            .font(.customfont(.semibold, fontSize: 10))
                            .foregroundColor(.primaryText)
                            .padding(8)
                            .background(Color.placeholder.opacity(0.5))
                            .cornerRadius(5)
                        
                        Button {
                            withAnimation {
                                detailVM.showNutrition()
                            }
                        } label: {
                            Image(detailVM.isShowNutrition ? "detail_open" : "next" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    
                    if detailVM.isShowNutrition {
                        LazyVStack {
                            ForEach (detailVM.nutritionArr , id: \.id) {
                                nObj in
                                HStack {
                                    Text("Calories")
                                        .font(.customfont(.semibold, fontSize: 15))
                                        .foregroundColor(.secondaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("89")
                                        .font(.customfont(.semibold, fontSize: 15))
                                        .foregroundColor(.primaryText)
                                    
                                }
                                Divider()
                            }
                            .padding(.vertical,10)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                
                HStack {
                    Text("Review")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack (spacing: 2){
                        ForEach(1...5,id: \.self) {
                            index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.orange)
                                .frame(width: 15, height: 15)
                        }
                    }
                    
                    Divider()
                    
                    Button {
                       
                    }label: {
                        Image( "next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)
                    }
                    .foregroundColor(Color.secondaryText)
                }
                .padding(.horizontal, 20)
                
                RoundButton(title: "Add To Basket") {
                    
                }
                .padding(.horizontal, 20)
                
            }
            
            RoundButton(title: "Add To Baskeet") {
                CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.id, qty: detailVM.qty) { idDone, msg in
                    detailVM.qty = 1
                    self.detailVM.errorMessage = msg
                    self.detailVM.showError = true
                }
            }
            
           
            
            VStack {
                HStack {
                    Button {
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                    Spacer()
                    
                    Button {
                    }label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                    
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage),dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView()
}
