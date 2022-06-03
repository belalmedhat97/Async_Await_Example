//
//  Network.swift
//  Await
//
//  Created by belal medhat on 02/06/2022.
//
import Foundation

class NetworkCaller{
    // define the func as async so can be called with await to handle the incoming result with throws for exceptions
   static func request() async throws ->  (DogResponse?,DogErrorResponse?,Error?) {
        let session = URLSession(configuration: .default)
        // wait for the request to return back the api call results
        let (data,response) = try await session.data(from: URL(string: "https://dog.ceo/api/breeds/image/random")!)
        if let HTTPResponse = response as? HTTPURLResponse {
            switch HTTPResponse.statusCode {
            case 200..<300:
                do{
                    // 1 - return back the success respnse from server
                    let responseDecoded = try JSONDecoder().decode(DogResponse.self, from: data)
                    return (responseDecoded,nil,nil)
                }catch{
                    // 3 - return back error decode
                    return(nil,nil,error)
                }
            case 400...500:
                do{
                    // 2 - return back error response from server
                    let responseDecoded = try JSONDecoder().decode(DogErrorResponse.self, from: data)
                    return (nil,responseDecoded,nil)
                }catch{
                    // 3 - return back error decode
                    return(nil,nil,error)
                }
        
            default:
                print("")
            }
        }

        return (nil,nil,nil)
    }
    }

