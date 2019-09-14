//
//  PairCreator.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 13.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class PairCreator {
    static var sharedInstance = PairCreator()

    func checkIfConsistInPairs(currencyPair: CurrencyPair) -> Bool {
        Defaults.sharedInstance.getPairsFromUserdefaults()

        var isInPair = false
        for pair in Shared.shared.currencyPairs {
            guard let isBaseEqual = pair.base?.codeName?.isEqual(currencyPair.base?.codeName),
                let isCuoteEqual = pair.cuote?.codeName?.isEqual(currencyPair.cuote?.codeName) else {
                return false
            }
            isInPair = isBaseEqual && isCuoteEqual
            if isInPair {
                break
            }
        }
        return isInPair
    }

    func createCurrencyPair(base: Currency, cuote: Currency) {
        let currencyPair = CurrencyPair(base: base, cuote: cuote)
        Defaults.sharedInstance.getPairsFromUserdefaults()

        if !checkIfConsistInPairs(currencyPair: currencyPair) {
            JsonFetcher.sharedInstance.fetchData(currencyPair: currencyPair)
            Shared.shared.currencyPairs.append(currencyPair)
            Defaults.sharedInstance.updatePairsToUserdefaults()
            goToResults()
        }
    }

    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while topController.presentedViewController != nil {
            topController = topController.presentedViewController!
        }
        return topController
    }

    func goToResults() {
        let topVC = topMostController()
        let currenciesListViewController: RateResultsViewController = RateResultsViewController()
        topVC.present(currenciesListViewController, animated: true, completion: nil)
    }
}
