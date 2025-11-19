//
//  ResponseModel.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupResponseModel: Decodable {
    var statusCode: Int?
    var message: String?
}

struct LoginResponseModel: Decodable {
    var statusCode: Int?
    var message: String?
    
    init(){
        statusCode = nil
        message = nil
    }
}
