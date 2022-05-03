//
//  ProductListViewController.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit
import Combine

class ProductListViewController: UIViewController {
    
    private var productListView =  ProductListView()
    
    //Todo: remove later- Prasanth
    private var productWebService = ProductsWebService()
    private var cancellable: AnyCancellable?
    
    var productListPresenter:ProductListPresenterProtocol?
    
    
    
    private var products = [Product](){
        didSet{
            productListView.tableView.reloadData()
        }
    }
    
    @available(*,unavailable,renamed: "init()")
    required init?(coder:NSCoder){
        super.init(coder: coder)!
    }
    
    init(with presenter: ProductListPresenterProtocol) {
            self.productListPresenter = presenter
            super.init(nibName: nil, bundle: nil)
    }

    
//     func instance(presenter:ProductListPresenterProtocol) -> ProductListViewController {
//
//    }

//    @available(*,unavailable,renamed: "init()")
//    required init?(coder: NSCoder) {
//        fatalError("Invalid")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.productListView.tableView)
        self.view.backgroundColor = UIColor.white
        self.productListView.tableView.delegate = self
        self.productListView.tableView.dataSource = self
        self.productListView.tableView.constrainToFillSuperview()
        
        //******
        //Uncomment this section of code to view items in table
        //Todo: update later- Prasanth
//        self.cancellable = self.productWebService.getProductList()
//            .catch{ _ in Just(self.products)}
//            .assign(to:\.products , on: self)
        
        
        
        guard let presentherProtocol = self.productListPresenter else {
            print ("Not initialised")
            return
        }
        presentherProtocol.initiateProductList()
        
    }
}

extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count // TODO:
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.productListView.tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = self.products[indexPath.row]
        cell.titleLabel.text = product.title
        return cell
    }
    
    
}

extension ProductListViewController : UITableViewDelegate {
    
}
