//
//  iOSTestingTests.swift
//  iOSTestingTests
//
//  Created by Medi Assumani on 4/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import XCTest
@testable import iOSTesting

class iOSTestingTests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitle() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let targetViewController = storyBoard.instantiateInitialViewController() as! ViewController
        
        _ = targetViewController.view
        XCTAssertEqual("Hello World", targetViewController.title)
    }
    
    func testTextField(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let targetViewController = storyBoard.instantiateInitialViewController() as! ViewController
        _ = targetViewController.view
        
        XCTAssertEqual(app.textFields["usernameTextField"].placeholderValue, "Enter Your Name")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
