//
//  Currency.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 5.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class Currency: NSObject, NSCoding {
    var flagName: String?
    var codeName: String?
    var name: String?

    func encode(with aCoder: NSCoder) {
        aCoder.encode(flagName, forKey: "flagName")
        aCoder.encode(codeName, forKey: "codeName")
        aCoder.encode(name, forKey: "name")
    }

    required init?(coder aDecoder: NSCoder) {
        flagName = aDecoder.decodeObject(forKey: "flagName") as? String
        codeName = aDecoder.decodeObject(forKey: "codeName") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }

    init(flagName: String, codeName: String, name: String) {
        self.flagName = flagName
        self.codeName = codeName
        self.name = name
    }
}
