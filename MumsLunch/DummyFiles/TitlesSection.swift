//
//  TitlesSection.swift
//  MumsLunch
//
//  Created by Richard Price on 08/10/2020.
//

import UIKit

class TitlesSection: AnotherSection {
    
    let numberOfItems = 1
    private let title: String
    init(title: String) {
        self.title = title
    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [items])
        let section = NSCollectionLayoutSection(group: group)
        return section

    }
    
    func configureCells(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitlesTestingCell.self), for: indexPath) as! TitlesTestingCell
        cell.set(title: title)
        return cell
    }
}
