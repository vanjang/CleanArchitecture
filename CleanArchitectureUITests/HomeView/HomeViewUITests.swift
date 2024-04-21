//
//  HomeViewUITests.swift
//  CleanArchitectureUITests
//
//  Created by myung hoon on 22/04/2024.
//

import XCTest

final class HomeViewUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testImageViewShowing() throws {
        let imageView = app.images["HomeViewImageViewID"]
        XCTAssert(imageView.exists)
    }
    
    func testProceedButtonShowing() throws {
        let proceedButton = app.buttons["HomeViewProceedButtonID"]
        XCTAssert(proceedButton.exists)
    }
}
