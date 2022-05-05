//
//  CartListViewControllerTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-05.
//

import XCTest
@testable import CapitalOneShoppingCartDemo

class CartListViewControllerTests: XCTestCase {

    var viewControllerUnderTest: CartListViewController!
    var presenter: MockCartListPresenter!
    
    override func setUpWithError() throws {
        
        presenter = MockCartListPresenter()
        presenter.initiateCartProductList()
        self.viewControllerUnderTest = CartListViewController(with: presenter)
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    
        presenter.products = [Product.defaultProduct]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.cartListView.cartTableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.cartListView.cartTableView?.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
      //  XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.cartListView.cartTableView?(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.cartListView.cartTableView?.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.cartListView.cartTableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? CartListTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = CartListTableViewCell.reuseIdentifier
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }


}
