//
//  TitlesTestingCell.swift
//  MumsLunch
//
//  Created by Richard Price on 08/10/2020.
//

import UIKit

class TitlesTestingCell: UICollectionViewCell {
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 25)
        lable.textColor = .systemBlue
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        setupUI()
    }
    private func setupUI() {
        contentView.addSubview(titleLable)
        titleLable.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    func set(title: String) {
        self.titleLable.text = title
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
