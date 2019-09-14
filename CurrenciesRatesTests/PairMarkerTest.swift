//
//  PairMarkerTest.swift
//  CurrenciesRatesTests
//
//  Created by Dilyana Yankova on 14.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import CurrenciesRates

class PairMarkerTest: XCTestCase {
    
    var marker: PairMarker!
    
    override func setUp() {
        marker = PairMarker()
    }
    
    override func tearDown() {
        marker = nil
}
    func testGetExistingPairsWhenEmpty(){
        let result = marker.getExistingPairs(index: 0)
        let expectation = [CurrencyPair]()
        XCTAssertEqual(result, expectation)
    }

    func testGetExistingPairsWithTwoPairs(){
        let currency1 =  Shared.shared.currencies[0]
        let currency2 =  Shared.shared.currencies[1]
        let currency3 =  Shared.shared.currencies[2]
        
        let currencyPair1 =  CurrencyPair(base: currency1, cuote: currency2)
        let currencyPair2 =  CurrencyPair(base: currency1, cuote: currency3)
        Shared.shared.currencyPairs.append(currencyPair1)
        Shared.shared.currencyPairs.append(currencyPair2)
        
        let result = marker.getExistingPairs(index: 0)
        let expectation = [currencyPair1, currencyPair2]
        XCTAssertEqual(result, expectation)
    }
      
}
