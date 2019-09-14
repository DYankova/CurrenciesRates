//
//  LaunchViewController.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 5.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    lazy var addBtn: AddButton = {
        let btn = AddButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    lazy var explanationLbl: UILabel = {
        let label = UILabel()
        label.text = "Choose a currency pair to compare their live rates "
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "Robonto", size: 18)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(addBtn)
        view.addSubview(explanationLbl)

        addConstraints()
    }

    func addConstraints() {
        addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true

        addBtn.heightAnchor.constraint(equalToConstant: 150).isActive = true
        addBtn.addTarget(self, action: #selector(openCurrenciesList), for: UIControl.Event.touchUpInside)

        explanationLbl.topAnchor.constraint(equalTo: addBtn.bottomAnchor).isActive = true
        explanationLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        explanationLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive = true
        explanationLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive = true
    }

    @objc func openCurrenciesList() {
        let currenciesListViewController: CurrenciesListViewController = CurrenciesListViewController()
        present(currenciesListViewController, animated: true, completion: nil)
    }
}
