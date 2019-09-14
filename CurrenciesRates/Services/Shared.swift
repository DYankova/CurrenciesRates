//
//  Shared.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 9.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

final class Shared {
    static let shared = Shared()

    var currencies: [Currency] =
        [Currency(flagName: "gbp.png", codeName: "GBP", name: "British Pound"),
         Currency(flagName: "eur.png", codeName: "EUR", name: "Euro"),
         Currency(flagName: "usd.png", codeName: "USD", name: "US Dollar"),
         Currency(flagName: "aud.png", codeName: "AUD", name: "Australian Dollar"),
         Currency(flagName: "cad.png", codeName: "CAD", name: "Canadian Dollar"),
         Currency(flagName: "czk.png", codeName: "CZK", name: "Czech Koruna"),
         Currency(flagName: "dkk.png", codeName: "DKK", name: "Danish Krone"),
         Currency(flagName: "jpy.png", codeName: "JPY", name: "Japanese Yen"),
         Currency(flagName: "pln.png", codeName: "PLN", name: "Polish Zloty"),
         Currency(flagName: "ron.png", codeName: "RON", name: "Romanian Leu"),
         Currency(flagName: "sek.png", codeName: "SEK", name: "Swedish Krone"),
         Currency(flagName: "bgn.png", codeName: "BGN", name: "Bulgarian Lev")]

    var currencyPairs = [CurrencyPair]()

    var endPoint = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?pairs="
}
