//
//  XCUITestCrashUITests.swift
//  XCUITestCrashUITests
//
//  Created by Andriy Gordiychuk on 15/06/2020.
//  Copyright © 2020 Andriy Gordiychuk. All rights reserved.
//

import XCTest

extension XCUIElement {

    func swipeRight() {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.45
        let pressDuration: TimeInterval = 0.05
        let moreThanHalf = half + adjustment

        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: half))
        let rightOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))

        centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
    }
}

class XCUITestCrashUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.activate()
        // Open Today View
        let bottomPoint = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 2))
        app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).press(forDuration: 0.1, thenDragTo: bottomPoint)
        sleep(1)
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        springboard.scrollViews.firstMatch.swipeRight()
        sleep(1)
        springboard.scrollViews.firstMatch.swipeUp()
        sleep(2)
        springboard.buttons["Edit"].press(forDuration: 1)
        
        sleep(2)
        sleep(1)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
