//
//  Service.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 12.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class CurrencySelector {
    var isBaseCurrency = true
    var shared = Shared.shared
    var base = Currency(flagName: "", codeName: "", name: "")
    var cuote = Currency(flagName: "", codeName: "", name: "")

    static var sharedInstance = CurrencySelector()

    func selectCurrency(currency: Currency) {
        if isBaseCurrency {
            base = currency
            isBaseCurrency = false
        } else if !isBaseCurrency {
            cuote = currency
            if base != cuote {
                PairCreator.sharedInstance.createCurrencyPair(base: base, cuote: cuote)
                isBaseCurrency = true
            }
        }
    }
}
