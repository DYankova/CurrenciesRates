////
////  ExchangeRateController.swift
////  CurrenciesRates
////
////  Created by Dilyana Yankova on 5.09.19.
////  Copyright © 2019 Dilyana Yankova. All rights reserved.
////
//
// import UIKit
//
// class ExchangeRateController: UIViewController {
//
//    var isBaseCurrency = true
//    var shared = Shared.shared
//    var  base = Currency(flagName: "", codeName: "", name: "")
//    var  cuote = Currency(flagName: "", codeName: "", name: "")
//
//    func getRate(currency: Currency){
//        if isBaseCurrency  {
//            base = currency
//            isBaseCurrency = false
//        } else if !isBaseCurrency {
//            cuote = currency
//            if base != cuote  {
//                createCurrencyPair(base: base, cuote: cuote)
//                isBaseCurrency = true
//            }
//        }
//    }
//
//    func checkIfConsist(currencyPair : CurrencyPair) -> Bool {
//        getPairsFromUserdefaults()
//        var isInPair = false
//        for pair in shared.currencyPairs {
//            isInPair = ((pair.base?.isEqual(currencyPair.base) ?? false) && ((pair.cuote?.isEqual(currencyPair.cuote) ?? false)))
//        }
//         return isInPair
//    }
//
//    func getPairsFromUserdefaults(){
//        if let helpData = UserDefaults.standard.object(forKey: pairsKey) as? NSData {
//            shared.currencyPairs = (NSKeyedUnarchiver.unarchiveObject(with: helpData as Data) as? [CurrencyPair])!
//        }
//    }
//
//    func updatePairsToUserdefaults(){
//        let helpData = NSKeyedArchiver.archivedData(withRootObject:  shared.currencyPairs)
//        userdefaults.set(helpData, forKey: pairsKey)
//    }
//
//    func createCurrencyPair(base: Currency, cuote: Currency)  {
//        let currencyPair = CurrencyPair(base: base, cuote: cuote)
//        getPairsFromUserdefaults()
//        if !checkIfConsist(currencyPair: currencyPair) {
//            shared.currencyPairs.append(currencyPair)
//            fetchData(baseSymbol: base.codeName!, cuoteSymbol: cuote.codeName!, currencyPair: currencyPair)
//            //fetch!
//
//            updatePairsToUserdefaults()
//            goToResults()
//        }
//    }
//
//    func goToResults(){
//        let currenciesListViewController: RateResultsViewController = RateResultsViewController()
//        self.present(currenciesListViewController, animated: true, completion: nil)
//    }
//
//    @objc func goToCurrenciesList(){
//        let currenciesListViewController: CurrenciesListViewController = CurrenciesListViewController()
//        self.present(currenciesListViewController, animated: true, completion: nil)
//    }
//
//
//    func fetchData(baseSymbol: String, cuoteSymbol: String, currencyPair: CurrencyPair)  {
//
//        guard let url = URL(string: shared.endPoint + cuoteSymbol+baseSymbol+"&pairs="+baseSymbol+cuoteSymbol + "") else {return}
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let dataResponse = data,
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//
//            do {
//                let jsonResponse = try JSONSerialization.jsonObject(with:
//                    dataResponse, options: [])
//
//                guard let jsonArray = jsonResponse as? [String: Double]
//                    else {return}
//
//                //["CZKJPY": 4.8661, "JPYCZK": 0.2093]
//
//                 let  exchangeRate =  Array(jsonArray)[1].value
//                 currencyPair.exchangeRate = String(exchangeRate)
//                    self.updatePairsToUserdefaults()
////                 self.goToResults()
//
//
//            } catch let parsingError {
//                print("Error", parsingError)
//            }
//        }
//
//        task.resume()
//    }
//
// }
