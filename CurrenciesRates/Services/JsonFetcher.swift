//
//  JsonFetcher.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 12.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class JsonFetcher {
    static var sharedInstance = JsonFetcher()

    func fetchData(currencyPair: CurrencyPair) {
        let baseCode = currencyPair.base?.codeName ?? ""
        let cuoteCode = currencyPair.base?.codeName ?? ""

        guard let url = URL(string: Shared.shared.endPoint + baseCode + cuoteCode) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let dataResponse = data,
                error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])

                guard let jsonArray = jsonResponse as? [String: Double]
                else { return }
                let exchangeRate = Array(jsonArray)[0].value
                currencyPair.exchangeRate = String(exchangeRate)
                Defaults.sharedInstance.updatePairsToUserdefaults()

            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
