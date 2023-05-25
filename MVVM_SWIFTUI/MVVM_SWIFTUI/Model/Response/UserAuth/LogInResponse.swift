//
//  LogInResponse.swift
//  MVVM_SWIFTUI
//
//  Created by Darshan Panchal on 25/05/23.
//


import Foundation

struct LogInResponse : Codable {
    let code : Int?
    let message : String?
    let data : LogInResponseData?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(LogInResponseData.self, forKey: .data)
    }

}
struct LogInResponseData : Codable {
    let id : UserID?
    let name : String?
    let email : String?
    let token : String?
    
    enum CodingKeys: String, CodingKey {

        case id = "Id"
        case name = "Name"
        case email = "Email"
        case token = "Token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(UserID.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        
    }
}
enum UserID:Codable{
    //String Int Float
    case int(Int)
    case string(String)
 
    init(from decoder: Decoder) throws {
          if let intValue = try? decoder.singleValueContainer().decode(Int.self){
              self = .int(intValue)
              return
          }
          if let stringvalue = try? decoder.singleValueContainer().decode(String.self){
              self = .string(stringvalue)
              return
          }
          throw TypeError.missingvalue
      }
      enum TypeError:Error{
          case missingvalue
      }
   
}

