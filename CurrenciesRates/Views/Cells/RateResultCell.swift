//
//  RateResultCell.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 8.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class RateResultCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var codeLabelBase: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20.0)
        label.textColor = UIColor.black
        return label
    }()

    lazy var nameLabelBase: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 14)
        label.textColor = UIColor.lightGray
        return label
    }()

    lazy var codeLabelCuote: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20.0)
        label.textColor = UIColor.black
        return label
    }()

    lazy var nameLabelCuote: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 14)
        label.textColor = UIColor.lightGray
        return label
    }()

    lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .clear
        btn.setTitleColor(.blue, for: .normal)
        if let image = UIImage(named: "deletePair") {
            btn.setImage(image, for: .normal)
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    func setupViews() {
        addSubview(codeLabelBase)
        addSubview(nameLabelBase)
        addSubview(codeLabelCuote)
        addSubview(nameLabelCuote)
        addSubview(deleteButton)

        codeLabelBase.heightAnchor.constraint(equalToConstant: 30).isActive = true
        codeLabelBase.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true

        nameLabelBase.topAnchor.constraint(equalTo: codeLabelBase.bottomAnchor, constant: 5).isActive = true

        codeLabelCuote.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        codeLabelCuote.heightAnchor.constraint(equalToConstant: 30).isActive = true
        codeLabelCuote.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor).isActive = true

        nameLabelCuote.topAnchor.constraint(equalTo: codeLabelBase.bottomAnchor, constant: 5).isActive = true
        nameLabelCuote.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor).isActive = true

        deleteButton.topAnchor.constraint(equalTo: codeLabelBase.topAnchor, constant: 15).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
