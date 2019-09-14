//
//  CurrenciesListViewController.swift
//  CurrenciesRates
//
//  Created by Dilyana Yankova on 5.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class CurrenciesListViewController: UIViewController {
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
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CurrencyCell.self, forCellWithReuseIdentifier: "CurrencyCell")
        collectionView.reloadData()
    }
}

extension CurrenciesListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return Shared.shared.currencies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell

        cell.nameLabel.text = Shared.shared.currencies[indexPath.item].name
        cell.codeLabel.text = Shared.shared.currencies[indexPath.item].codeName

        if let image: UIImage = UIImage(named: Shared.shared.currencies[indexPath.item].flagName ?? "") {
            cell.flagImage.image = image
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Defaults.sharedInstance.getPairsFromUserdefaults()
        CurrencySelector.sharedInstance.selectCurrency(currency: Shared.shared.currencies[indexPath.item])
        let pairs = PairMarker.sharedInstance.getExistingPairs(index: indexPath.item)
        markCuotes(collectionView: collectionView, pairs: pairs)
    }

    func markCuotes(collectionView: UICollectionView, pairs: [CurrencyPair]) {
        for pair in pairs {
            for cell in collectionView.visibleCells as! [CurrencyCell] {
                guard let cuoteName = pair.cuote?.name else { return }
                if (cell.nameLabel.text?.isEqual(cuoteName))! {
                    cell.isSelected = true
                }
            }
        }
    }
}
