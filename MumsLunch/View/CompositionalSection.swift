//
//  CompositionalSection.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

protocol Section {
    var numberOfitems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
