//
//  RealmDatabaseTests.swift
//  PodcastAppTests
//
//  Created by İbrahim Halil ULU on 9.10.2024.
//

import XCTest
import RealmSwift

@testable import PodcastApp
final class RealmDatabaseTests: XCTestCase {
    var realmDatabase: RealmDatabase!
    override func setUpWithError() throws {
        self.realmDatabase = RealmDatabase(
            inMemoryIdentfier: "TestableRealm",
            objects: [TestObject.self]
        )
    }

    func testAddItem(){
        let testObject = TestObject()
        testObject.name = "TEST"
        
        realmDatabase.add(model: testObject)
        
        let items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name,"TEST")

    }

}


internal class TestObject : Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    
    var id: String{
        return _id.stringValue
    }
}
