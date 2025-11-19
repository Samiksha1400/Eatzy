//
//  DataModel.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupDM: Codable {
    
    var mobileNumber: String = ""
    var name: String = ""
    var email: String = ""
    var isLoggedIn: Bool = false
    var isOtpVerified: Bool = false
    var isSignUpProcessError: Bool = false
    var error = ""
    
    mutating func loginSuccess(statusCode: Int) {
        isLoggedIn = (statusCode == 200 || statusCode == 201)
    }
    
    mutating func otpSuccess(statusCode: Int?) {
        isOtpVerified = (statusCode == 200)
    }
    
    mutating func isSignUpValid() -> Bool {
        
        switch isMobileNumberValid() {
            
        case true:
            
            switch isNameValid() {
                
            case true:
                
                switch isEmailValid() {
                    
                case true:
                    isSignUpProcessError = false
                    return true
                case false:
                    error = "Invalid Email"
                    
                    isSignUpProcessError = true
                    return false
                }
                
            case false:
                error = "Name should not be empty"
                
                isSignUpProcessError = true
                return false
            }
            
        case false:
            error = "Mobile Number should be 10 digits long"
            isSignUpProcessError = true
            return false
        }
    }

    func isMobileNumberValid() -> Bool {
        return !mobileNumber.isEmpty && mobileNumber.count == 10
    }
    
    private func isEmailValid() -> Bool {
       return UtilityFunctions.isValidEmail(email: email)
    }

    private func isNameValid() -> Bool {
        return !name.isEmpty
    }
    
}

struct LoginDM: Codable {
    
    var mobileNumber: String = ""
    var email: String = ""
    var isLoggedIn: Bool = false
    var isOtpVerified: Bool = false
    
    var isLoginFailed = false
    
    mutating func loginSuccess(statusCode: Int) {
        isLoggedIn = (statusCode == 200)
        
        if statusCode == 200 {
            isLoginFailed = false
        }else{
            isLoginFailed = true
        }
    }
    
    mutating func otpSuccess(statusCode: Int) {
        isOtpVerified = (statusCode == 200)
    }
    
    
    
}
