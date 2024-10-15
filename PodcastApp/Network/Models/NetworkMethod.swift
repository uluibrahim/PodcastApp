//
//  NetworkMethod.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import Foundation
import Alamofire

enum NetworkMethod{
    case GET
    case PUT
    case POST
    
    var httpMethod: HTTPMethod{
        switch self {   
        case .GET:
                .get
        case .PUT:
                .put
        case .POST:
                .post
        }
        
    }
}
