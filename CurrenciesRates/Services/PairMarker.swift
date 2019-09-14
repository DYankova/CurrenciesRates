//
//  Marker.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 12.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class PairMarker {
    static var sharedInstance = PairMarker()

    func getExistingPairs(index: Int) -> [CurrencyPair] {
        let markedBase = Shared.shared.currencies[index]
        var currencyPairs = [CurrencyPair]()
        for pair in Shared.shared.currencyPairs {
            guard let base = pair.base else {
                return currencyPairs
            }
            if base.name!.isEqual(markedBase.name) {
                currencyPairs.append(pair)
            }
        }
        return currencyPairs
    }
}
