//
//  GroceriesShopApp.swift
//  GroceriesShop
//https://www.youtube.com/playlist?list=PLzcRC7PA0xWSuwiPqTEhLLMncu0kVWnyU
//  Created by van xuat Tran on 11/9/24.
//https://github.com/codeforany/Online_Groceries_Shop_App_with_MVVM_in_SwiftUI

import SwiftUI

@main
struct GroceriesShopApp: App {
    @StateObject var mainVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
