//
//  AddButton.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 5.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class AddButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var blueColor = UIColor(red: 0.0, green: 0.46, blue: 0.92, alpha: 1)

    func setup() {
        setImage(UIImage(named: "plus_icon.pdf"), for: .normal)
        setTitle("Add currency pair", for: .normal)
        setTitleColor(blueColor, for: .normal)
        titleLabel?.font = UIFont(name: "Robonto", size: 16)
        imageView?.contentMode = .scaleAspectFit

        imageEdgeInsets = UIEdgeInsets(top: 170, left: 170, bottom: 170, right: 170)
        titleEdgeInsets = UIEdgeInsets(top: 80, left: 30, bottom: 0, right: 38)
    }

    open override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 1 : 0.3
        }
    }
}
