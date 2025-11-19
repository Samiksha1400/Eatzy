//
//  LoginView.swift
//  Eatzy
//
//  Created by shivam dahale on 25/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var vm: AuthServices
    
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
//            Button("Login"){
//                $vm.loginModel.isLoginFailed = false
//            }
//            .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
            
            //Navigate to Login
            NavigationLink(destination: OtpView(vm: vm, isSignup: false),isActive: $vm.loginModel.isOtpVerified) { }
            
            HStack{
                Spacer()
                Text("Don't have an account?")
                NavigationLink(destination: SignupView(vm: vm)){
                    Text("Signup")
                        .foregroundColor(.blue)
                }
                Spacer()
            }
        }
        .padding(.horizontal)
        .alert(isPresented: $vm.loginModel.isLoginFailed, error: StringError(NSLocalizedString("User not found", comment: ""))) {
            Button {
                vm.loginModel.isLoginFailed.toggle()
            } label: {
                Text("Okay")
            }

        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthServices())
}
