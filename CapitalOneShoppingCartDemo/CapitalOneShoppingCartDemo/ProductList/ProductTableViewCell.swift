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
    
    public let productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.image = UIImage(named: "thumbnail")
        productImage.contentMode = .scaleToFill
        return productImage
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .gray
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titleLabel)
      //  self.stackView.addArrangedSubview(self.productImage)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: self.titleLabel.constraintsToFillSuperview(insets: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)))

        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

