//
//  NetworkManager.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import Foundation
import Alamofire

final class NetworkManager : NetworkManagerProtocol{
    private let config: NetworkConfig
    private let decoder: JSONDecoder
    
    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()) {
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    /// Send your request
    /// - Parameters:
    ///   - path: NetworkPath
    ///   - method: HttpMethod
    ///   - type: Generic decodable Type
    ///   - body: Nullable or Encodable
    ///   - paramater: Query Params
    ///   - Returns: Result with success response or error
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        paramater: Parameters? = nil
    )
    async -> Result<T?, Error> {
        let url = config.baseUrl + path.value
        
        let request : DataRequest
        
        
        if let body{
            request = AF.request(
                url,
                method: method.httpMethod,
                parameters: body,
                encoder: JSONParameterEncoder.default
            )
        }else{
            request = AF.request(
                url,
                method: method.httpMethod,
                parameters: paramater
            )
        }
        let response = await request.validate()
            .serializingDecodable(T.self, decoder: self.decoder)
            .response
        
        guard let responseValue = response.value else{
            return .failure(response.error ?? NetworkError.unknown)
        }
        
        
        
        return .success(responseValue)
    }
}
