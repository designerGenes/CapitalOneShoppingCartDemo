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
    
    var productListView =  ProductListView()
    
    //Todo: remove later- Prasanth
    private var productWebService = ProductsWebService()
    private var cancellable: AnyCancellable?
    
    var productListPresenter: ProductListPresenterProtocol!
    private var cancellables = Set<AnyCancellable>()
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.productListView.tableView)
        self.view.backgroundColor = UIColor.white
        setupTableView()
        setupNavigationWithAddToCartButton()
        sinkToPublishers()
        self.title = "Product List"
        
        guard let presenterProtocol = self.productListPresenter else {
            print ("Not initialised")
            return
        }
        presenterProtocol.initiateProductList()
        self.products = presenterProtocol.getAllProducts()
    }
    
    private func sinkToPublishers() {
        productListPresenter?.productsListPublisher.sink {
            self.productListView.tableView.reloadData()
        }.store(in: &cancellables)
        
    }
    
    private func setupTableView() {
        self.productListView.tableView.delegate = self
        self.productListView.tableView.dataSource = self
        self.productListView.tableView.constrainToFillSuperview()
        self.productListView.tableView.rowHeight = UITableView.automaticDimension
        self.productListView.tableView.estimatedRowHeight = 600
    }
    
    private func setupNavigationWithAddToCartButton() {
        let cartScreenNavigation = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(navigateToCartScreen))
        
        cartScreenNavigation.title = "ADD TO CART"
        self.navigationItem.rightBarButtonItem  = cartScreenNavigation
    }
    
    @objc private func navigateToCartScreen() {
        print("Show Next Cart List Screen")
        //TODO: Uncomment when we merge Ritu and Jaden work for CartList
        
        let cartListViewController = CartListViewController()
        self.navigationController?.present(cartListViewController, animated: true) {
            //TODO: Add Code if needed
        }
        
    }
}

extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productListPresenter.productsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.productListView.tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = productListPresenter.getCurrentProduct(at: indexPath.row)
        
        cell.productImage.image = nil
        cell.titleLabel.text = product.title
        cell.descriptionLabel.text = product.description
        cell.starRatingsView.rating = Int(product.rating)
        cell.priceLabel.text =  "$" + "\(product.price)"
        cell.stockLabel.text =  "\(product.stock) units are in stock"
        cell.addToCartButton.setTitle("Add to Cart", for: .normal)
        
 
        guard let imageURL = product.thumbnail else {
            return UITableViewCell()
        }
        cell.productImage.loadImageUsingCacheWithUrlString(urlString: imageURL)
        return cell
    }
    
    
}

extension ProductListViewController : UITableViewDelegate {
    
}
