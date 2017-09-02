//
//  MethodCell.swift
//  PinLayoutSample
//
//  Created by DION, Luc (MTL) on 2017-06-13.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import PinLayout

class MethodCell: UITableViewCell {
    static let reuseIdentifier = "MethodCell"
    fileprivate let padding: CGFloat = 10
    
    fileprivate let rootFlexContainer = UIView()
    
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero
        
//        contentView.addSubview(iconImageView)
        
        let iconImageView = UIImageView(image: UIImage(named: "method"))
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
//        contentView.addSubview(nameLabel)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
//        contentView.addSubview(descriptionLabel)
        
        rootFlexContainer.flex.direction(.row).padding(padding).define { (flex) in
            flex.addItem(iconImageView)
//            flex.addItem().direction(.row).define { (flex) in
//                flex.addItem(imageView).width(100).aspectRatio(of: imageView)
//                
//                flex.addItem().direction(.column).paddingLeft(12).grow(1).shrink(1).define { (flex) in
//                    flex.addItem(segmentedControl).marginBottom(12).grow(1)
//                    flex.addItem(label)
//                }
//            }
//            
//            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
//            flex.addItem(bottomLabel).marginTop(12)
        }
        
        contentView.addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    @discardableResult
    fileprivate func layout() -> CGSize {
        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top().left().width(100%)
        
        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        
        return CGSize(width: frame.width, height: rootFlexContainer.frame.maxY + 10)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        frame = CGRect(origin: .zero, size: size)
        return layout()
    }
    
    func configure(method: Method) {
        nameLabel.text = method.name
        descriptionLabel.text = method.description
    }
}
