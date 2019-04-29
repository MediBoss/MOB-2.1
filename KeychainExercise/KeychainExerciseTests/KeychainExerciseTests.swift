//
//  KeychainExerciseTests.swift
//  KeychainExerciseTests
//
//  Created by Medi Assumani on 4/29/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import XCTest
import KeychainSwift

@testable import KeychainExercise

class KeychainExerciseTests: XCTestCase {

    var keychainUnderTest: KeychainSwift!
    
    override func setUp() {
        
        keychainUnderTest = KeychainSwift()
        keychainUnderTest.set("hello", forKey: "test")
    }

    override func tearDown() {
        keychainUnderTest = nil
    }

    /// Test retrieving a value from the keychain store
    func testKeychainGet() {
        
        
        if let value = keychainUnderTest.get("test") {
            XCTAssertEqual(value, "hello")
        }
    }
    
    /// Test updating a value from the keychain store
    func testKeychainUpdate() {
        
        var oldValue = keychainUnderTest.get("test")
        keychainUnderTest.set("medi", forKey: "test")
        var newValue = keychainUnderTest.get("test")
        XCTAssertFalse(oldValue == newValue)
    }
    
    /// Test removing a value from the keychain store
    func testKeychainDelete() {
        
        keychainUnderTest.delete("test")
        var nilValue = keychainUnderTest.get("test")
        XCTAssertNil(nilValue)
    }

}
