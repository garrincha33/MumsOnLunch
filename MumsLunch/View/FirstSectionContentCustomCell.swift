//
//  FirstSectionContentCustomCell.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class FirstSectionContentCustomCell: UICollectionViewCell {
    let FirstSectionImage: CustomImageView = {
        let recommenedImage = CustomImageView(frame: .zero)
        return recommenedImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
         setupUI()
    }
    

    
    private func setupUI() {
        contentView.addSubview(FirstSectionImage)
        FirstSectionImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        FirstSectionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        FirstSectionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        FirstSectionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
