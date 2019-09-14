//
//  Userdefaults.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 11.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import Foundation

class Defaults {
    static var sharedInstance = Defaults()
    let pairsKey = "pairsKey"
    let userdefaults = UserDefaults.standard

    func getPairsFromUserdefaults() {
        if let helpData = userdefaults.object(forKey: pairsKey) as? NSData {
            Shared.shared.currencyPairs = (NSKeyedUnarchiver.unarchiveObject(with: helpData as Data) as? [CurrencyPair] ?? [])
        }
    }

    func updatePairsToUserdefaults() {
        let helpData = NSKeyedArchiver.archivedData(withRootObject: Shared.shared.currencyPairs)
        userdefaults.set(helpData, forKey: pairsKey)
    }
}
