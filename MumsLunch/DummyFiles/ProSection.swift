//
//  ProSection.swift
//  MumsLunch
//
//  Created by Richard Price on 12/10/2020.
//

import UIKit

protocol JustSections {
    var numberOFItemsforSection : Int { get }
    func configureSection() -> NSCollectionLayoutSection
    func configureCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
