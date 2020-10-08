//
//  AnotherSection.swift
//  MumsLunch
//
//  Created by Richard Price on 08/10/2020.
//

import UIKit

protocol AnotherSection {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection
    func configureCells(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
