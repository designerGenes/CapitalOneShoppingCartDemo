//
//  CartListViewController.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit


class CartListViewController: UIViewController {
    private let cartListView = CartListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(cartListView)
        cartListView.translatesAutoresizingMaskIntoConstraints = false
        cartListView.constrainToFillSuperview()
        
        self.cartListView.cartTableView?.delegate = self
        self.cartListView.cartTableView?.dataSource = self
        self.cartListView.cartTableView?.register(CartListTableViewCell.self, forCellReuseIdentifier: "CartListTableViewCell")

    }
}

extension CartListViewController : UITableViewDelegate, UITableViewDataSource{
  
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
