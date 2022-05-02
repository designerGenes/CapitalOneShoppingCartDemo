//
//  CartListView.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit


class CartListView: UIView {

    var cartTableView: UITableView?
    var cartTotalContainerView: UIView?
    
    private func setup() {
        let _ = subviews.map({$0.removeFromSuperview()}) // just in case
        let cartTableView = UITableView()
        let cartTotalContainerView = UIView()
        self.cartTableView = cartTableView
        self.cartTotalContainerView = cartTotalContainerView
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
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartListTableViewCell.self, forCellReuseIdentifier: "CartListTableViewCell")
        cartTableView.rowHeight = UITableView.automaticDimension
        cartTableView.estimatedRowHeight = UITableView.automaticDimension

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()

    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CartListView : UITableViewDelegate, UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //TMP
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell", for: indexPath) as? CartListTableViewCell {
            return cell
        }

        //cell.setupCell(withProduct: product)

        return UITableViewCell()
    }

}
