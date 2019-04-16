//
//  TripStopTests.swift
//  TripStopTests
//
//  Created by Medi Assumani on 4/1/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import XCTest
@testable import TripStop

class TripStopTests: XCTestCase {

    var tripUnderTest: Trip!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tripUnderTest = Trip(name: "Trip To Germany")
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        tripUnderTest = nil
    }

    func testTripModel() {
        
        XCTAssertNil(tripUnderTest.waypoints)
        XCTAssertNotNil(tripUnderTest.name)
        XCTAssertEqual(tripUnderTest.name, "Trip To Germany")
    }

    
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
