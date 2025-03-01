//
//  SignInView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 15/9/24.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth,height: .screenWidth)
                Spacer()
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack {
                        Button {
                            isShowPicker.toggle()
                        } label: {
                          //  Image("")
                            
                            if let countryObj =  countryObj {
                                
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                
                                Text("\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        TextField("Enter", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                       
                    Text("Continute with Email Sign In")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                       
                    Text("Continute with Email Sign Up")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 60, maxHeight: 60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    
                    
                    Divider().padding(.bottom,25)
                    
                    Text("Or connect with social mdedia")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity,alignment:.center)
                        .padding(.bottom, 25)
                    
                    Button {
                        
                    }label: {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continute with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    Button {
                        
                    }label: {
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continute with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "4A66AC"))
                    .cornerRadius(20)
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.6)
                
                
               
                
            }
            
        }
        .onAppear {
            self.countryObj = Country(phoneCode: "+84", isoCode: "VI")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    SignInView(txtMobile: "")
}
