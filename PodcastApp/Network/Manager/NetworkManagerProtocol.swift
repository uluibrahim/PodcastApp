//
//  NetworkManagerProtocol.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol{
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable?,
        paramater: Parameters?
    ) async -> Result<T?, Error> 
}

