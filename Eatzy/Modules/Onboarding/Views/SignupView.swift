//
//  SignupView.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var vm = SignupVM()
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 10){
                
                TextField("Mobile Number", text: $vm.signupModel.mobileNumber)
                    .keyboardType(.numberPad)
                    .roundedTextBackground(cornerRadius: 12)
                
                TextField("Name", text: $vm.signupModel.name)
                    .roundedTextBackground(cornerRadius: 12)
                
                TextField("Email", text: $vm.signupModel.email)
                    .keyboardType(.emailAddress)
                    .roundedTextBackground(cornerRadius: 12)
                
                Button("Signup"){
                    vm.signup()
                }
                .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
                
                Text("Already have an account?")
                
                NavigationLink(destination: LoginView(vm: vm)){
                    Text("Login")
                }
                
                NavigationLink(destination: OtpView(vm: vm, isSignup: true), isActive: $vm.signupModel.isOtpVerified){ }
                
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SignupView()
}
