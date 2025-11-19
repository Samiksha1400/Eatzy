//
//  SignupVM.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import Foundation

class AuthServices: ObservableObject {
    
    @Published var signupModel = SignupDM()
    @Published var loginModel = LoginDM()
    
    @Published var otpCode = ""
    
    let onboardingServices = OnboardingServices()
    
    var users: [String: [String: String]] = [:]
    
    func signup() {
        
        if signupModel.isSignUpValid() {
            
            let otpReq = SignupRequestModel(model: signupModel)
            
            onboardingServices.sendOtp(model: otpReq){ response, error in
                
                if let response = response {
                    self.evaluateSignupResponse(response: response)
                }else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func evaluateSignupResponse(response: SignupResponseModel){
        
        self.signupModel.otpSuccess(statusCode: response.statusCode)
        
        UserDefaults.standard.set([self.signupModel.mobileNumber: ["email" : self.signupModel.email, "name" : self.signupModel.name]], forKey: "Users")
        
        print(response)
        
    }
    
//    func login() {
//        
//        let users = UserDefaults.standard.value(forKey: "Users") as? [String: [String: String]]
//        
//        if let users = users {
//            for user in users {
//                if user.key == mobileNumber {
//                    
//                    let request = SignupRequestModel(model: loginModel)
//                    
//                    onboardingServices.sendOtp(model: request) { response, error in
//                        if let response = response {
//                            DispatchQueue.main.async {
//                                self.loginModel.otpSuccess(statusCode: response.statusCode)
//                                print(response)
//                            }
//                        } else if let error = error {
//                            print(error.localizedDescription)
//                        }
//                    }
//                }else{
//                    self.loginModel.isLoginFailed = true
//                }
//            }
//        }
//    }
    
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
            
            users = [signupModel.mobileNumber: ["name": signupModel.name, "email": signupModel.email]]
            print("User registered successfully: \(signupModel.mobileNumber)")
        } else {
            self.loginModel.loginSuccess(statusCode: 200)
            self.loginModel.otpSuccess(statusCode: 200)
        }
        
        print("OTP verified successfully")
        self.otpCode = ""
    }
}
