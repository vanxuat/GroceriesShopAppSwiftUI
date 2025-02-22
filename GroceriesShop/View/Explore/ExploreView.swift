//
//  ExploreView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 16/9/24.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var explorVM = ExploreViewModel.shared
    @State var textSearch: String = ""
    
    var colums = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 15)
    ]
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Favourites")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                }
                .padding(.top, .topInsets)
                
                SearchTextField(txt: $textSearch, placholder: "Search Store")
                    .padding(.horizontal,20)
                    .padding(.bottom, 4)
                
                ScrollView {
                    LazyVGrid(columns: colums, spacing: 15){
                        ForEach(explorVM.listArr, id: \.id) {
                            cObj in
                            
                            NavigationLink(destination:  ExploreItemsView(itemVm:ExploreItemViewModel(catObj:cObj) )) {
                                ExploreCategoryCell(cObj: cObj)
                                    .aspectRatio(0.95, contentMode: .fill)
                            }
                            
                            
                            
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
}
