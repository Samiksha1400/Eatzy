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
    
    mutating func loginSuccess(statusCode: Int) {
        isLoggedIn = (statusCode == 200 || statusCode == 201)
    }
    
    mutating func otpSuccess(statusCode: Int) {
        isOtpVerified = (statusCode == 200)
    }
}

struct LoginDM: Codable {
    
    var mobileNumber: String = ""
    var email: String = ""
    var isLoggedIn: Bool = false
    var isOtpVerified: Bool = false
    
    mutating func loginSuccess(statusCode: Int) {
        isLoggedIn = (statusCode == 200)
    }
    
    mutating func otpSuccess(statusCode: Int) {
        isOtpVerified = (statusCode == 200)
    }
}
