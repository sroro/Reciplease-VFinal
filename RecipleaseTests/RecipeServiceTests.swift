//
//  RecipeServiceTests.swift
//  RecipleaseTests
//
//  Created by Rodolphe Schnetzer on 25/01/2021.
//  Copyright © 2021 Rodolphe Schnetzer. All rights reserved.
//

import XCTest
@testable import Reciplease
import Alamofire

class RecipeServiceTests: XCTestCase {

    func testGetData_WhenNoDataIsPassed_ThenShouldReturnFailedCallback() {
        
        let session = MockReciplease(fakeResponse: FakeResponse(response: nil, data: nil))
        let requestService = RequestService(session: session)
        let expectation = XCTestExpectation(description: "Waiting...")
        requestService.getData(ingredient: "") { (result) in
            guard case .failure(let error) = result else {
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    func testGetData_WhenIncorrectResponseIsPassed_ThenShouldReturnFailedCallback() {
        let session = MockReciplease(fakeResponse: FakeResponse(response:FakeResponseData.responsoKo , data: FakeResponseData.correctData))
        let requestService = RequestService(session: session)
        let expectation = XCTestExpectation(description: "waiting...")
        requestService.getData(ingredient: "") { (result) in
            guard case .failure(let error) = result else {
                XCTFail()
            return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    func testGetData_WhenUndeccodableDataIsPassed_ThenShouldReturnFailedCallback() {
        let session = MockReciplease(fakeResponse: FakeResponse(response: FakeResponseData.responseOk, data: FakeResponseData.incorrectData))
        let requestService = RequestService(session: session)
        let expectation = XCTestExpectation(description: "waiting...")
        requestService.getData(ingredient: "") { (result) in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetData_WhenCorrectDataIsPassed_ThenShouldReturnSuccededCallback() {
        let session = MockReciplease(fakeResponse: FakeResponse(response: FakeResponseData.responseOk, data: FakeResponseData.correctData))
        let requestService = RequestService(session: session)
        let expectation = XCTestExpectation(description: "waiting...")
        requestService.getData(ingredient: "chicken") { (result) in
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertTrue(data.hits[0].recipe.label == "Salsa Chicken & Cheese Tortillas")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
}
