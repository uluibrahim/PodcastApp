//
//  NetworkPath.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import Foundation

enum NetworkPath: String,  NetworkPathProtocol{
    var value: String{
        self.rawValue
    }
    
    case login = "/login"
}


protocol NetworkPathProtocol{
    var value: String {get}
}
