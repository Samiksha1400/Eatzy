//
//  Enum.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import SwiftUI

enum HttpMethod: String{
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum BaseURL: String {
    case dev = "https://d02517ce-7c0e-45f0-bf51-e60e458fd734.mock.pstmn.io"
}

enum EndPoint: String {
    case signup = "/signup"
    case login = "/login"
    case sendOtp = "/sendOtp"
    case verifyOtp = "/verifyOtp"
}
