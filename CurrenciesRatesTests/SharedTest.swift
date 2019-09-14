//
//  SharedTest.swift
//  CurrenciesRatesTests
//
//  Created by Dilyana Yankova on 14.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//
import UIKit
import XCTest
@testable import CurrenciesRates

class SharedTest: XCTestCase {
    func testCurrenciesCount(){
        let result = Shared.shared.currencies.count
        let expectation = 12
        XCTAssertEqual(result, expectation)
    }
}
