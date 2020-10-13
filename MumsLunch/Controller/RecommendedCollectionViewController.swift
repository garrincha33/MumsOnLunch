//
//  RecommendedCollectionViewController.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class RecommendedCollectionViewController: UICollectionViewController {
    let sections: [Section] = [
        TitleSection(title: "Baby Friendly", isShowAllHidden: true),
        RecommendedSection(),
        TitleSection(title: "Popular", isShowAllHidden: false),
        RecommendedSection()
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        makeCall()

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
    private func setupNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        let width = view.frame.width + 15
        let titleView = UIView()
        titleView.frame = .init(x: 0, y: 0, width: width, height: 50)
        titleView.backgroundColor = .red
        navigationItem.titleView = titleView
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
    @Published var datas = [datatype]()
    
    private func makeCall() {
        let url1 = "https://developers.zomato.com/api/v2.1/geocode?lat=51.489847&lon=-3.177570"
        let apiKey = "8fd6be973bdad266a0e5ae078981e696"
        let url = URL(string: url1)
        var req = URLRequest.init(url: url!)
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.addValue(apiKey, forHTTPHeaderField: "user-key")
        req.httpMethod = "GET"
        
        let sess = URLSession(configuration: .default)
        sess.dataTask(with: req) {(data,_,_) in
            do {
                let fetch = try JSONDecoder().decode(Type.self, from: data!)
                print(fetch)
                for i in fetch.nearby_restaurants {
                    print(i.restaurant)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    required init?(coder: NSCoder) {
        fatalError("Not using storyboards for project")
        
    }
}
