//
//  OtpView.swift
//  Eatzy
//
//  Created by shivam dahale on 30/09/25.
//

import SwiftUI

struct OtpView: View {
    @ObservedObject var vm: AuthServices
    var isSignup: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading,spacing: 10){
                    Text("We have sent an OTP to \(UtilityFunctions.maskNumber(vm.signupModel.mobileNumber))")
                        .subtitleTextStyle()
                    
                    TextField("Enter OTP", text: $vm.otpCode)
                        .roundedTextBackground(cornerRadius: 12)
                    
                    Button("Verify Otp"){
                        vm.verifyOTP(isSignup: isSignup)
                    }
                    .roundedButtonBackground(cornerRadius: 12, background: .orange, foregroundColor: .white)
                     
                    NavigationLink(destination: HomepageView(),isActive: isSignup ? $vm.signupModel.isLoggedIn : $vm.loginModel.isLoggedIn) {}
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("OTP verification")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    OtpView(vm: AuthServices(), isSignup: false)
}
