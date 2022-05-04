//
//  CartListViewController.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit


class CartListViewController: UIViewController {
    
    //MARK: - Outlets
    private let cartListView = CartListView()
    
    //MARK: - ViewDid LifeCycle
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
    
    //MARK: - Button Actions
    @objc func checkoutButtonAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Thanks For Shopping With Us!", message: "Your order has been successfully placed. Please check your email for more information.", preferredStyle: .alert)
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
  
    //MARK: - TableView Delegates & DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //TMP
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell", for: indexPath) as? CartListTableViewCell {
            cell.setupCell(withProduct: ["":""] as! AnyObject) //TMP
            return cell
        }
        return UITableViewCell()
    }

}
