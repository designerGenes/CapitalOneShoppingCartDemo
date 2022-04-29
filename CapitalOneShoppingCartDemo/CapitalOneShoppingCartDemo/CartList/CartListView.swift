//
//  CartListView.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit


class CartListView: UIView {
    let cartTableView = UITableView()
    let cartTotalContainerView = UIView()
    
    private func setup() {
        self.backgroundColor = .blue // TMP!
        cartTableView.backgroundColor = .red // TMP!
        cartTotalContainerView.backgroundColor = .yellow // TMP!
        addSubview(cartTableView)
        addSubview(cartTotalContainerView)
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        cartTotalContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartTableView.topAnchor.constraint(equalTo: topAnchor),
            cartTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartTableView.bottomAnchor.constraint(equalTo: cartTotalContainerView.topAnchor),
            cartTotalContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartTotalContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartTotalContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cartTotalContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setup()
        
    }
}
