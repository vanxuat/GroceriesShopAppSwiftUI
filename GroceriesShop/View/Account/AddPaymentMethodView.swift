//
//  AddPaymentMethodView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 6/10/24.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var paymentVM = PaymentViewModel.shared
    @State var isEdit: Bool = false
    
    @State var editObj: AddressModel?
    var didSelect: ((_ obj: AddressModel) -> ())?
    @State var isPicker: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 15){
                 
                    LineTextField(txt: $paymentVM.txtName ,title: "Name",placholder: "Enter you name")
                    LineTextField(txt: $paymentVM.txtCardNumber, title: "Card Number",placholder: "Enter card number" ,keyboardType: .numberPad)
                
                    HStack {
                        LineTextField(txt: $paymentVM.txtCardMonth ,title: "MM",placholder: "Enter Card Month",keyboardType: .numberPad)
                        LineTextField(txt: $paymentVM.txtCardYear ,title: "YYYY",placholder: "Enter Card year",keyboardType: .numberPad)
                    }
                   
                    RoundButton(title: "Add Payment Method") {
                       
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
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
                    Text("Add Payment Method")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                .cornerRadius(5)
                .onTapGesture {
                    
                }
                
                Spacer()
              
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
    AddPaymentMethodView()
}
