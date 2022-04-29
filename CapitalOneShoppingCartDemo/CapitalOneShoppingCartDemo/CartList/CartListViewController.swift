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
    }
}
