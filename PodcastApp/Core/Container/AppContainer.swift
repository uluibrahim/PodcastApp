//
//  AppContainer.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 15.10.2024.
//

import Foundation
import Swinject
import os.log

final class AppContainer{
    static let shared = AppContainer()
    private let container: Container
    private let logger: OSLog
    
    
    private init() {
        logger = OSLog(subsystem: "com.uluibrahim.PodcastApp", category: "AppContainer")
        container = Container()
        registerDependencies()
    }
    
    var networkManager : NetworkManager {
        guard let instance = container.resolve(NetworkManager.self) else {
            os_log(.error, log: logger, "Network manager not registered")
            fatalError("Network manager not registered")
        }
        return instance
    }
    
    var realmDatabase : RealmDatabase {
        guard let instance = container.resolve(RealmDatabase.self) else {
            os_log(.error, log: logger, "Realm Database not registered")
            fatalError("Realm Database not registered")
        }
        return instance
    }
    
    
    /// Register for global object with this method
    private func registerDependencies(){
        os_log(.info, log: logger, "Registering dependency")
        container.register(NetworkManager.self){ _ in
            NetworkManager(config: NetworkConfig(baseUrl: ""))
        }
        
        container.register(RealmDatabase.self) { _ in RealmDatabase() }
    }
}
