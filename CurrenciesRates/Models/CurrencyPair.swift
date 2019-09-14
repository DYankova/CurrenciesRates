//
//  CurrencyPair.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 8.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class CurrencyPair: NSObject, NSCoding {
    var base: Currency?
    var cuote: Currency?
    var exchangeRate: String?

    func encode(with aCoder: NSCoder) {
        aCoder.encode(base, forKey: "base")
        aCoder.encode(cuote, forKey: "cuote")
        aCoder.encode(exchangeRate, forKey: "exchangeRate")
    }

    required init?(coder aDecoder: NSCoder) {
        base = aDecoder.decodeObject(forKey: "base") as? Currency
        cuote = aDecoder.decodeObject(forKey: "cuote") as? Currency
        exchangeRate = aDecoder.decodeObject(forKey: "exchangeRate") as? String
    }

    init(base: Currency, cuote: Currency) {
        self.base = base
        self.cuote = cuote
    }
}
