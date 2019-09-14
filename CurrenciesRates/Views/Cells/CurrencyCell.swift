//
//  CurrencyCell.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 5.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var flagImage: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = UIColor.lightGray
        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 16)
        label.textColor = UIColor.black
        return label
    }()

    func setupViews() {
        addSubview(flagImage)
        addSubview(codeLabel)
        addSubview(nameLabel)

        flagImage.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        flagImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        flagImage.heightAnchor.constraint(equalToConstant: 30).isActive = true

        codeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        codeLabel.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 20).isActive = true
        codeLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: codeLabel.rightAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    override var isSelected: Bool {
        willSet {
            super.isSelected = newValue
            if newValue {
                alpha = 0.4
            }
        }
    }
}
