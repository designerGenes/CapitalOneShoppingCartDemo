//
//  ProductListViewControllerTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import XCTest
@testable import CapitalOneShoppingCartDemo

class ProductListViewControllerTests: XCTestCase {

    var viewControllerUnderTest: ProductListViewController!
    var presenter: MockProductListPresenter!
    
    override func setUpWithError() throws {
        
        presenter = MockProductListPresenter()
        presenter.initiateProductList()
        self.viewControllerUnderTest = ProductListViewController(with: presenter)
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    
        presenter.listOfProducts = [Product.defaultProduct]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
      //  XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.cartListView.cartTableView?(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.productListView.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.productListView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ProductTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = ProductTableViewCell.reuseIdentifier
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

//    func testTableCellHasCorrectLabelText() {
//        
//        viewControllerUnderTest.productListView.tableView.reloadData()
//        let cell0 = viewControllerUnderTest.tableView(viewControllerUnderTest.productListView.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ProductTableViewCell
//        
//        XCTAssertEqual(cell0?.titleLabel.text, "iPhone 9")
//        
//        let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.productListView.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? ProductTableViewCell
//        XCTAssertEqual(cell1?.titleLabel.text, "iPhone X")
//    }
}

