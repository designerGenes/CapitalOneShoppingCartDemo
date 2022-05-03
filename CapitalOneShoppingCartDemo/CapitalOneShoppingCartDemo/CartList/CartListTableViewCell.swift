//
//  CartListTableViewCell.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 4/29/22.
//

import Foundation
import UIKit

class CartListTableViewCell: UITableViewCell {
    private let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let productPriceLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()

    private let productRemoveButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red //TMP
        btn.layer.cornerRadius = 10 //TMP
        btn.titleLabel?.textColor = .white //TMP
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12) //TMP
        return btn
    }()

    private let productImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productPriceLabel)
        addSubview(productRemoveButton)
        
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds =  true
        
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 70, height: 70, enableInsets: true)
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        productPriceLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 20, paddingRight: 0, width: frame.size.width - 120, height: 0, enableInsets: false)
        productRemoveButton.anchor(top: productPriceLabel.topAnchor, left: productPriceLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: 80, height: 30, enableInsets: false)


        productNameLabel.text  = "iPhone" //TMP
        productPriceLabel.text  = "$ 10,000" //TMP
        productImage.image = UIImage(named: "thumbnail") //TMP
        productRemoveButton.setTitle("Remove", for: .normal) //TMP

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
