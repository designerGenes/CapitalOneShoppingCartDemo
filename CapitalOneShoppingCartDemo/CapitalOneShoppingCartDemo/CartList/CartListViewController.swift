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

        self.cartListView.checkoutButton.addTarget(self, action: #selector(checkoutButtonAction), for: .touchUpInside)

    }
    
    @objc func checkoutButtonAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Success", message: "Your order is successfully received. Please check your email for more information.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                print("default")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CartListViewController : UITableViewDelegate, UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //TMP
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell", for: indexPath) as? CartListTableViewCell {
            return cell
        }

        //cell.setupCell(withProduct: product)

        return UITableViewCell()
    }

}
