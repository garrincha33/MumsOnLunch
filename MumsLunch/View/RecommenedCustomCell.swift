//
//  RecommenedCustomCell.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class RecommenedCustomCell: UICollectionViewCell {
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemYellow
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        contentView.addSubview(titleLable)
        titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
    }
        func set(title: String) {
        titleLable.text = title
    }
}
