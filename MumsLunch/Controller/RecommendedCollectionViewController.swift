//
//  RecommendedCollectionViewController.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class RecommendedCollectionViewController: UICollectionViewController {
    let sections: [Section] = [
        TitleSection(title: "Recommended", isShowAllHidden: true),
        RecommendedSection(),
        TitleSection(title: "Popular", isShowAllHidden: true),
        TitleSection(title: "Favourites", isShowAllHidden: true),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    private func setupCollectionView() {
        collectionView.collectionViewLayout = titleLableSetup()
        collectionView.backgroundColor = .white
        let cells: [RegisterableView] = [
            .class(RecommenedCustomCell.self),
            .class(FirstSectionContentCustomCell.self),
        ]
        collectionView.register(cells: cells)
    }
    private func titleLableSetup() -> UICollectionViewCompositionalLayout {
        let sections = self.sections
        let layout = UICollectionViewCompositionalLayout {(sectionIndex, enviroment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfitems
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    required init?(coder: NSCoder) {
        fatalError("Not using storyboards for project")
        
    }
}
