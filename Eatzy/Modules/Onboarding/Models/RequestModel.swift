//
//  RequestModel.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupReqM: Codable {
    
    var mobileNumber: String?
    var name: String?
    var email: String?
    var otp: String?
    
    init(model: SignupDM){
        self.mobileNumber = model.mobileNumber
        self.name = model.name
        self.email = model.email
    }
    
    init(model: LoginDM) {
        self.mobileNumber = model.mobileNumber
        self.email = model.email
    }
    
    init(mobileNumber: String?, email: String?, otp: String) {
        self.mobileNumber = mobileNumber
        self.email = email
        self.name = nil
        self.otp = otp
    }
}
