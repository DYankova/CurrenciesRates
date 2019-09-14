//
//  JsonFetcherTest.swift
//  CurrenciesRatesTests
//
//  Created by Dilyana Yankova on 13.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import CurrenciesRates

class PairCreatorTest: XCTestCase {
    
    var pairCreator: PairCreator!
    
    override func setUp() {
        pairCreator = PairCreator()
    }
    
    override func tearDown() {
        pairCreator = nil
    }

    func testConsistInPairTrue() {
        let currency1 =  Shared.shared.currencies[0]
        let currency2 =  Shared.shared.currencies[1]
        let currency3 =  Shared.shared.currencies[2]
        
        let currencyPair1 =  CurrencyPair(base: currency1, cuote: currency2)
        let currencyPair2 =  CurrencyPair(base: currency1, cuote: currency3)
        Shared.shared.currencyPairs.append(currencyPair1)
        Shared.shared.currencyPairs.append(currencyPair2)
        
        let result = pairCreator.checkIfConsistInPairs(currencyPair: currencyPair1)
        XCTAssertTrue(result)
    }
    
    func testConsistInPairFalse() {
        let currency1 =  Shared.shared.currencies[0]
        let currency2 =  Shared.shared.currencies[1]
        let currency3 =  Shared.shared.currencies[2]
        let currency4 =  Shared.shared.currencies[3]
        
        let currencyPair1 =  CurrencyPair(base: currency1, cuote: currency2)
        let currencyPair2 =  CurrencyPair(base: currency2, cuote: currency3)
        let currencyPair3 =  CurrencyPair(base: currency2, cuote: currency4)
        
        Shared.shared.currencyPairs.append(currencyPair1)
        Shared.shared.currencyPairs.append(currencyPair2)
        
        let result = pairCreator.checkIfConsistInPairs(currencyPair: currencyPair3)
        XCTAssertTrue(result)
    }
     
}
