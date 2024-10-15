//
//  NetworkManagerDemoTests.swift
//  PodcastAppTests
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import XCTest


@testable import PodcastApp
final class NetworkManagerDemoTests: XCTestCase {
    var networkManager: NetworkManager!
    override func setUpWithError() throws {
        networkManager = NetworkManager(config: NetworkConfig(baseUrl: "https://openwhyd.org/"))
    }
    
    func testWithMusicResponse() async {
        let result = await networkManager.send(path: MockPath.music, method: .GET, type: [MusicElement].self)
        
        switch result{
            
        case .success(let response):
            XCTAssertNotNil(response)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    
}




// MARK: - MusicElement
struct MusicElement: Codable {
    let id, uID, uNm, text: String?
    let name, eID, ctx: String?
    let img: String?
    let nbP, nbR: Int?
    let lov: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case uID = "uId"
        case uNm, text, name
        case eID = "eId"
        case ctx, img, nbP, nbR, lov
    }
}


enum MockPath: String, NetworkPathProtocol{
    var value: String{
        self.rawValue
    }
    
    case music = "adrien?format=json"
    
    
}
