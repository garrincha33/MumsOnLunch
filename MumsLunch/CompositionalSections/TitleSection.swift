//
//  TitleSection.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class TitleSection: Section {
    var numberOfitems = 1
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(73))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [items])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RecommenedCustomCell.self ), for: indexPath) as! RecommenedCustomCell
        cell.set(title: title)
        return cell
    }
    let numberOfItems = 1
    private let title: String
    private let isShowAllHidden: Bool
    init(title: String, isShowAllHidden: Bool) {
        self.title = title
        self.isShowAllHidden = isShowAllHidden
    }

}
