//
//  HouseCell.swift
//  FlexLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-10-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import FlexLayout

class HouseCell: UICollectionViewCell {
    static let reuseIdentifier = "HouseCell"
    fileprivate let nameLabel = UILabel()
    fileprivate let mainImage = UIImageView()
    fileprivate let priceLabel = UILabel()
    fileprivate let distanceLabel = UILabel()
    
    fileprivate let padding: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        
        mainImage.backgroundColor = .black
        mainImage.contentMode = .scaleAspectFill

        contentView.flex.padding(padding).define { (flex) in
            flex.addItem(nameLabel).grow(1)
            flex.addItem(mainImage).height(300)
            
            flex.addItem().direction(.row).justifyContent(.end).define({ (flex) in
//                priceLabel
                flex.addItem(distanceLabel)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(house: House) {
        nameLabel.text = house.name
        nameLabel.flex.markDirty()
        
        mainImage.download(url: house.mainImageURL)
        
        distanceLabel.text = "\(house.distance) KM"
        distanceLabel.flex.markDirty()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size //CGSize(width: contentView.frame.width, height: contentView.frame.height + padding)
    }
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
}
