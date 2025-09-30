//
//  LoginView.swift
//  Eatzy
//
//  Created by shivam dahale on 25/09/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm: SignupVM
    
    var body: some View {
        VStack( alignment: .leading ,spacing: 10){
            
            Text("LOGIN")
                .titleTextStyle()
                
            Text("Enter your mobile number to proceed")
                .subtitleTextStyle()
                
            //MARK: - Mobile Number
            TextField("Mobile Number", text: $vm.loginModel.mobileNumber)
                .roundedTextBackground(cornerRadius: 12)
                .keyboardType(.emailAddress)
            
            //MARK: - Login Button
            Button("Login"){
                vm.login()
            }
            .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
            
            //Navigate to Login
            NavigationLink(destination: OtpView(vm: vm, isSignup: false),isActive: $vm.loginModel.isOtpVerified) { }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView(vm: SignupVM())
}
