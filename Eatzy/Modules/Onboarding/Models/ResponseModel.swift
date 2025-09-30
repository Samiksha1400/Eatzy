//
//  ResponseModel.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

struct SignupResM: Codable {
    var statusCode: Int
    var message: String
}

struct LoginResM: Codable {
    var statusCode: Int
    var message: String
}
