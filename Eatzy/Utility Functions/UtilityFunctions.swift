//
//  UtilityFunctions.swift
//  Eatzy
//
//  Created by shivam dahale on 23/09/25.
//

import Foundation

class UtilityFunctions {
    
    //MARK: Encode Request
    class func encodeRequest<T: Codable>(req: T) -> Data? {
        
        guard let encodedRequest = try? JSONEncoder().encode(req) else{
            return nil
        }
        return encodedRequest
    }
    
    //MARK: - Decode Response
    class func decodeResponse<T: Codable>(responseType: T.Type, data: Data) -> T? {
        
        guard let decodedResponse = try? JSONDecoder().decode(responseType.self, from: data)else{
            return nil
        }
        return decodedResponse
    }
    
    //MARK: - Email Pattern: abc@gmail.com
    class func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    
    //MARK: - Password Pattern: Min 8 chars, at least 1 uppercase, 1 lowercase, 1 digit
    class func isValidPassword(password: String) -> Bool {
        let passwordRegex = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: password)
    }
    
    class func maskNumber(_ number: String) -> String {
        guard number.count > 2 else { return number }
        let lastTwo = number.suffix(2)
        return String(repeating: "*", count: number.count - 2) + lastTwo
    }

}
