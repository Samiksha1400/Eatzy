//
//  SignupVM.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import Foundation

class SignupVM: ObservableObject {
    
    @Published var signupModel = SignupDM()
    @Published var loginModel = LoginDM()
    let onboardingServices = OnboardingServices()
    @Published var otpCode = ""
    
    var users: [String: [String: String]] = [:]
    
    func signup() {
        
        // Validation
        guard !signupModel.mobileNumber.isEmpty, signupModel.mobileNumber.count == 10 else {
            print("Invalid Mobile Number")
            return
        }
        
        guard UtilityFunctions.isValidEmail(email: signupModel.email) else {
            print("Invalid Email")
            return
        }
        
        guard !signupModel.name.isEmpty else {
            print("Name cannot be empty")
            return
        }
        
        if users[signupModel.mobileNumber] != nil {
            print("User already exists")
            return
        }
        
        users = [signupModel.mobileNumber: ["name": signupModel.name, "email": signupModel.email]]
        
        let otpReq = SignupReqM(model: signupModel)
        onboardingServices.sendOtp(model: otpReq){ response, error in
            
            if let response = response {
                DispatchQueue.main.async {
                    self.signupModel.otpSuccess(statusCode: response.statusCode)
                    print(response)
                }
            }else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func login() {
        let mobileNumber = loginModel.mobileNumber
        
        // Validate mobile number
        guard !mobileNumber.isEmpty, mobileNumber.count == 10 else {
            print("Invalid Mobile Number")
            return
        }
        
        guard let user = users[mobileNumber] else {
            print("Mobile number not registered. Please signup first.")
            return
        }
        
        let request = SignupReqM(model: loginModel)
        onboardingServices.sendOtp(model: request) { response, error in
            if let response = response {
                DispatchQueue.main.async {
                    self.loginModel.otpSuccess(statusCode: response.statusCode)
                    print(response)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Verify OTP
//        func verifyOTP(isSignup: Bool) {
//            let enteredOTP = otpCode
//            let otp = "1234"
//    
//            guard enteredOTP == otp else {
//                print("Invalid OTP")
//                return
//            }
//    
//            let otpRequest = SignupReqM(
//                mobileNumber: isSignup ? signupModel.mobileNumber : loginModel.mobileNumber,
//                email: isSignup ? signupModel.email : loginModel.email,
//                otp: otp
//            )
//            onboardingServices.verifyOtp(model: otpRequest) { response, error in
//                DispatchQueue.main.async {
//                    if let res = response, res.statusCode == 200 {
//                        if isSignup {
//                            self.signupModel.loginSuccess(statusCode: res.statusCode)
//                            self.signupModel.otpSuccess(statusCode: res.statusCode)
//                        } else {
//                            self.loginModel.loginSuccess(statusCode: res.statusCode)
//                            self.loginModel.otpSuccess(statusCode: res.statusCode)
//                        }
//                        print(res.message)
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }else{
//                        print("Otp verification failed")
//                    }
//                }
//            }
//        }
    
    func verifyOTP(isSignup: Bool) {
        let enteredOtp = otpCode
        let fixedOtp = "1234"
        
        guard enteredOtp == fixedOtp else {
            print("Invalid OTP entered")
            return
        }
        
        //Otp Verification
        if isSignup {
            self.signupModel.loginSuccess(statusCode: 200)
            self.signupModel.otpSuccess(statusCode: 200)
        } else {
            self.loginModel.loginSuccess(statusCode: 200)
            self.loginModel.otpSuccess(statusCode: 200)
        }
        
        print("OTP verified successfully")
    }
}
