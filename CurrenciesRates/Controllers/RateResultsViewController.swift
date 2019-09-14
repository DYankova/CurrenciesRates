//
//  RatesResultViewController.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 8.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class RateResultsViewController: UIViewController {
    var timer = Timer()
    lazy var addBtn: AddButton = {
        let btn = AddButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    override func loadView() {
        super.loadView()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addBtn)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])

        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RateResultCell.self, forCellWithReuseIdentifier: "RateResultCell")
        collectionView.reloadData()

        addBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 100)
        addBtn.titleEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 100)

        addBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.addTarget(self, action: #selector(goToCurrenciesList), for: UIControl.Event.touchUpInside)
        scheduledTimerWithTimeInterval()
    }
}

extension RateResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return Shared.shared.currencyPairs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RateResultCell", for: indexPath) as! RateResultCell
        cell.codeLabelBase.text = Shared.shared.currencyPairs[indexPath.item].base?.codeName
        cell.nameLabelBase.text = Shared.shared.currencyPairs[indexPath.item].base?.name

        cell.codeLabelCuote.text = Shared.shared.currencyPairs[indexPath.item].exchangeRate
        cell.nameLabelCuote.text = Shared.shared.currencyPairs[indexPath.item].cuote?.name

        cell.deleteButton.tag = indexPath.item
        cell.deleteButton.addTarget(self, action: #selector(deletePair), for: .touchUpInside)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 90)
    }

    @objc func refreshDate() {
        for pair in Shared.shared.currencyPairs {
            JsonFetcher.sharedInstance.fetchData(currencyPair: pair)
            collectionView.reloadData()
        }
    }

    func scheduledTimerWithTimeInterval() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refreshDate), userInfo: nil, repeats: true)
    }

    @objc func deletePair(sender: UIButton) {
        Shared.shared.currencyPairs.remove(at: sender.tag)
        collectionView.reloadData()
        Defaults.sharedInstance.updatePairsToUserdefaults()
    }

    @objc func goToCurrenciesList() {
        let currenciesListViewController: CurrenciesListViewController = CurrenciesListViewController()
        present(currenciesListViewController, animated: true, completion: nil)
    }
}
