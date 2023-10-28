//
//  CharactersViewControllerTests.swift
//  KinzooTaskUITests
//
//  Created by Victor Sebastian on 2023-10-27.
//

import XCTest
import UIKit

final class CharactersViewControllerTests: XCTestCase {
    var mockPresenter = CharactersAPIMock()
    
    func makeSUT() -> CharactersViewController {
        let sut = CharactersViewController()
        mockPresenter.setViewDelegate(delegate: sut)
        sut.presenter = mockPresenter
        sut.loadViewIfNeeded()
        return sut
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersAPI() {
        let sut = makeSUT()
        let timeInSeconds = 2.0
        let expectation = XCTestExpectation(description: "Rick Sanchez")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInSeconds) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: timeInSeconds + 1.0)
        
        XCTAssertEqual(sut.characters?.first?.name, expectation.description)
    }

}
