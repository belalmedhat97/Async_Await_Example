//
//  dogModel.swift
//  Await
//
//  Created by belal medhat on 02/06/2022.
//

import Foundation
struct DogResponse:Codable{
    var message:String?
    var status:String?
}
struct DogErrorResponse:Codable {
    var status:String?
    var message:String?
    var code:Int?
    }
