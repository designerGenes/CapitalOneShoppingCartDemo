//
//  ProductTableViewCell.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit

class ProductTableViewCell:UITableViewCell {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 4
        view.axis = .horizontal
        return view
    }()
    
    public let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.textColor = UIColor.blue
        return titleLabel
    }()
    
    public let descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .left
        description.numberOfLines = 0
        description.font = UIFont.boldSystemFont(ofSize: 16.0)
        description.textColor = UIColor.black
        return description
    }()
    
    public let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 0
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        priceLabel.textColor = UIColor.black
        return priceLabel
    }()
    
    public let starRatingsView: StarsView = {
        let starRatingView = StarsView()
        starRatingView.translatesAutoresizingMaskIntoConstraints = false
        return starRatingView
    }()
    
    public let productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.image = UIImage(named: "thumbnail")
        productImage.contentMode = .scaleAspectFill
        return productImage
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .gray
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        addSubview(self.titleLabel)
        addSubview(self.descriptionLabel)
        addSubview(self.productImage)
        addSubview(self.priceLabel)
        addSubview(self.starRatingsView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          bottom: nil,
                          right: nil,
                          paddingTop: 5.0,
                          paddingLeft: 5.0,
                          paddingBottom: 5.0,
                          paddingRight: 0.0,
                          width: frame.size.width / 2,
                          height: 0,
                          enableInsets: false)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor,
                                left: leftAnchor,
                                bottom: nil ,
                                right: nil,
                                paddingTop: 0.0,
                                paddingLeft: 5.0,
                                paddingBottom: 5.0,
                                paddingRight: 20.0,
                                width:  frame.size.width/2,
                                height: 0.0,
                                enableInsets: false)
        
        starRatingsView.anchor(top: descriptionLabel.bottomAnchor,
                                left: leftAnchor,
                                bottom: bottomAnchor ,
                                right: nil,
                                paddingTop: 0.0,
                                paddingLeft: 5.0,
                                paddingBottom: 5.0,
                                paddingRight: 5.0,
                                width: 200.0,
                                height: 20.0,
                                enableInsets: true)
        
        productImage.anchor(top: topAnchor ,
                            left: descriptionLabel.rightAnchor,
                            bottom: priceLabel.topAnchor ,
                            right: rightAnchor,
                            paddingTop: 0.0,
                            paddingLeft: 20.0,
                            paddingBottom: 5.0,
                            paddingRight: 5.0,
                            width: 300.0,
                            height: 0.0,
                            enableInsets: true)
        
        priceLabel.anchor(top: productImage.bottomAnchor,
                          left: productImage.leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor,
                          paddingTop: 0.0,
                          paddingLeft: 5.0,
                          paddingBottom: 5.0,
                          paddingRight: 5.0,
                          width: 100.0,
                          height: 20.0,
                          enableInsets: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

