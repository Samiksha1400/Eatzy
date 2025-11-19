//
//  SignupView.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var vm = AuthServices()
    
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
                    .autocapitalization(.none)
                    .roundedTextBackground(cornerRadius: 12)
                
                Button("Signup"){
                    vm.signup()
                }
                .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
                
                Text("Already have an account?")
                
                NavigationLink(destination: LoginView().environmentObject(vm) ){
                    Text("Login")
                }
                
                NavigationLink(destination: OtpView(vm: vm, isSignup: true), isActive: $vm.signupModel.isOtpVerified){ }
                
                
            }
            .padding(.horizontal)
        }
        .alert(isPresented: $vm.signupModel.isSignUpProcessError, error: StringError(NSLocalizedString(vm.signupModel.error, comment: ""))) {
            Button {
                vm.signupModel.isSignUpProcessError.toggle()
            } label: {
                Text("Okay")
            }

        }
    }
}

#Preview {
    SignupView()
}


struct StringError: LocalizedError {
    let errorDescription: String?
    
    init(_ description: String) {
        self.errorDescription = description
    }
}

