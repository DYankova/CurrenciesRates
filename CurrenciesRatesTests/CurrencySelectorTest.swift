//
//  CurrencySelectorTest.swift
//  CurrenciesRatesTests
//
//  Created by Dilyana Yankova on 14.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import CurrenciesRates

class PairCretorStub: PairCreator{
    
    var calledTimes = 0
    override func createCurrencyPair(base: Currency, cuote: Currency){
        calledTimes += 1
    }
}

class CurrencySelectorTest: XCTestCase {
    
    var selector: CurrencySelector!
    var stub = PairCretorStub()
    var currency1 =  Shared.shared.currencies[0]
    var currency2 =  Shared.shared.currencies[1]
    var currency3 =  Shared.shared.currencies[2]
    
    override func setUp() {
        selector = CurrencySelector()
        PairCreator.sharedInstance = stub
    }
    
    override func tearDown() {
        selector = nil
    }
    
    func testSelectCurrencyIfOneSelected(){
        selector.selectCurrency(currency: currency1)
        XCTAssertFalse(selector.isBaseCurrency)
        XCTAssertEqual(0, stub.calledTimes)
    }
    
    func testSelectCurrencyIfTwoSelected(){
        selector.selectCurrency(currency: currency1)
        selector.selectCurrency(currency: currency2)
        XCTAssertTrue(selector.isBaseCurrency)
        XCTAssertEqual(1, stub.calledTimes)
    }
    
    func testSelectCurrencyIfThreeSelected(){
        selector.selectCurrency(currency: currency1)
        selector.selectCurrency(currency: currency2)
        selector.selectCurrency(currency: currency3)
        XCTAssertFalse(selector.isBaseCurrency)
        XCTAssertEqual(1, stub.calledTimes)
    }
}
