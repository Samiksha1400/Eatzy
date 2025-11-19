//
//  RequestModel.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupRequestModel: Encodable {
    
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
}
