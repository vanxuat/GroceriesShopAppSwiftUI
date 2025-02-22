//
//  AddDeliveryAddressView.swift
//  GroceriesShop
//
//  Created by van xuat Tran on 3/10/24.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    
    @State var editObj: AddressModel?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 15){
                    HStack{
                        Button {
                            addressVM.txtTypeName = "Home"
                            
                        } label: {
                            Image(systemName:addressVM.txtTypeName == "Home" ? "record.circle" : "circle")
                            
                            Text("Home")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            
                        }
                        .foregroundColor(.primaryText)
                        
                        Button {
                            addressVM.txtTypeName = "Office"
                            
                        } label: {
                            Image(systemName:addressVM.txtTypeName == "Office" ? "record.circle" : "circle")
                            
                            Text("Office")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            
                        }
                        .foregroundColor(.primaryText)
                        
                    }
                    .padding(.bottom, 15)
                    
                    LineTextField(txt: $addressVM.txtName ,title: "Name",placholder: "Enter you name")
                    LineTextField(txt: $addressVM.txtMobile, title: "Mobile",placholder: "Enter you mobile" ,keyboardType: .numberPad)
                    LineTextField(txt: $addressVM.txtAddresss ,title: "Address Line",placholder: "Enter you address")
                    HStack {
                        LineTextField(txt: $addressVM.txtCity ,title: "City",placholder: "Enter you city")
                        LineTextField(txt: $addressVM.txtState ,title: "State",placholder: "Enter you state")
                    }
                    LineTextField(txt: $addressVM.txtPostalCode ,title: "Postal Code",placholder: "Enter you postal code")
                    
                    RoundButton(title: isEdit ? "Update Address" : "Add Address") {
                        if(isEdit) {
                            addressVM.servicCallUpdateAddress(aObj: editObj) {
                                self.mode.wrappedValue.dismiss()
                            }
                        } else {
                            addressVM.serviceCallAddAddress {
                                self.mode.wrappedValue.dismiss()
                            }
                        }
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
                    Text(isEdit ? "Edit Delivery Address" :"Deliery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                }
                .padding(.top,.topInsets)
                .padding(.horizontal,20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                .cornerRadius(5)
                
                Spacer()
              
            }
        }
        .onAppear {
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(aObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError, content: {
            Alert(title: Text(Globs.AppName),message: Text(addressVM.errorMessage),
                  dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddDeliveryAddressView()
}
