//
//  OtpView.swift
//  Eatzy
//
//  Created by shivam dahale on 30/09/25.
//

import SwiftUI

struct OtpView: View {
    @ObservedObject var vm: SignupVM
    var isSignup: Bool
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            
            Text("Enter OTP")
                .titleTextStyle()
            
            TextField("Enter OTP", text: $vm.otpCode)
                .roundedTextBackground(cornerRadius: 12)
            
            Button("Verify Otp"){
                vm.verifyOTP(isSignup: isSignup)
            }
            .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
            
            NavigationLink(destination: HomepageView(),isActive: isSignup ? $vm.signupModel.isLoggedIn : $vm.loginModel.isLoggedIn) {}
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    OtpView(vm: SignupVM(), isSignup: false)
}
