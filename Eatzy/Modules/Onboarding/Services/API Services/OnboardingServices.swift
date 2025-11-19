//
//  OnboardingServices.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import Foundation

class OnboardingServices {
    let networkManager = NetworkManager()
    
    //Send otp func for signup and login
    func sendOtp(model: SignupRequestModel, completion: @escaping (SignupResponseModel?, Error?) -> Void){
        networkManager.createRequest(baseURL: .dev, endpoint: .sendOtp, httpMethod: .GET, body: nil) { data, error in
            if let data = data {
                let decodedRes = UtilityFunctions.shared.decodeResponse(responseType: SignupResponseModel.self, data: data)
                completion(decodedRes, nil)
            }else {
                completion(nil, error)
            }
        }
    }
    
    //Verify otp
    func verifyOtp(model: SignupRequestModel, completion: @escaping (SignupResponseModel?, Error?) -> Void){
        networkManager.createRequest(baseURL: .dev, endpoint: .verifyOtp, httpMethod: .GET, body: nil) { data, error in
            if let data = data {
                let decodedRes = UtilityFunctions.shared.decodeResponse(responseType: SignupResponseModel.self, data: data)
                completion(decodedRes, nil)
            }else {
                completion(nil, error)
            }
        }
    }
}
