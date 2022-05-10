//
//  CartListViewController.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import UIKit
import Combine

class CartListViewController: UIViewController {
    
    //MARK: - Outlets
    let cartListView = CartListView()
    
    //MARK: - Variables
    var cartListPresenter: CartListPresenterProtocol!
    private var cancellables = Set<AnyCancellable>()
    let presetControlPassthroughSubject = PassthroughSubject<Int,Never>()
    
    private var products = [Product](){
        didSet{
            cartListView.cartTableView?.reloadData()
        }
    }
    

    //MARK: - ViewDid LifeCycle
    @available(*,unavailable,renamed: "init()")
    required init?(coder:NSCoder){
        super.init(coder: coder)!
    }
    
    init(with presenter: CartListPresenterProtocol) {
        self.cartListPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Printing counter *****>>>   \(Store.shared.appState.counter)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(cartListView)
        cartListView.translatesAutoresizingMaskIntoConstraints = false
        cartListView.constrainToFillSuperview()
        self.cartListView.cartTableView?.delegate = self
        self.cartListView.cartTableView?.dataSource = self
        self.cartListView.cartTableView?.register(CartListTableViewCell.self, forCellReuseIdentifier: "CartListTableViewCell")
        self.cartListView.checkoutButton.addTarget(self, action: #selector(checkoutButtonAction), for: .touchUpInside)
        
        //Sinked to Publisher for updates
        sinkToPublishers()

        guard let presenterProtocol = self.cartListPresenter else {
            print ("Not initialised")
            return
        }
        presenterProtocol.initiateCartProductList()
        self.products = presenterProtocol.getCartProducts()
        

        self.cartListView.subTotalPrice.text = "$ \(presenterProtocol.getSubTotal())"
        self.cartListView.taxesPrice.text = "$ \(presenterProtocol.getTaxes())"
        self.cartListView.totalPrice.text = "$ \(presenterProtocol.getTotal())"
        
    }
    

    //MARK: - Publisher
    private func sinkToPublishers() {
        cartListPresenter?.cartListPublisher.sink {
            self.cartListView.cartTableView?.reloadData()
            self.cartListView.subTotalPrice.text = "$ \(self.cartListPresenter.getSubTotal())"
            self.cartListView.taxesPrice.text = "$ \(self.cartListPresenter.getTaxes())"
            self.cartListView.totalPrice.text = "$ \(self.cartListPresenter.getTotal())"

        }.store(in: &cancellables)
    }

    
    //MARK: - Button Actions
    @objc func checkoutButtonAction(sender: UIButton!) {
        if self.cartListView.totalPrice.text != "$ 0.0"{
            let alert = UIAlertController(title: "Thanks For Shopping With Us!", message: "Your order has been successfully placed. Please check your email for more information.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    for item in self.cartListPresenter.getCartProducts(){
                        let repo = CartsRepository()
                        let cart = repo.getCart()
                        cart.removeProduct(id: item.id)
                        self.cartListPresenter.updateProductList()
                        self.presetControlPassthroughSubject.send(item.id)
                    }
                    self.dismiss(animated: true, completion: nil)
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
    
}

extension CartListViewController : UITableViewDelegate, UITableViewDataSource{
  
    //MARK: - TableView Delegates & DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.cartListPresenter != nil{
            return self.cartListPresenter.productsCount()
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTableViewCell", for: indexPath) as? CartListTableViewCell {
            let product = cartListPresenter.getCurrentProduct(at: indexPath.row)
            cell.setupCell(product: product)
            cell.selectionStyle = .none
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                let product = cartListPresenter.getCurrentProduct(at: indexPath.row)
                let repo = CartsRepository()
                let cart = repo.getCart()
                cart.removeProduct(id: product.id)
                cartListPresenter.updateProductList()
                presetControlPassthroughSubject.send(product.id)
                Store.shared.dispatch(action: .remove)
            }
        }

}
