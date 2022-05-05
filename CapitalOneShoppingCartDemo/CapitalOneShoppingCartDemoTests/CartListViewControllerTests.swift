//
//  CartListViewControllerTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Ritu on 04/05/22.
//

import XCTest
@testable import CapitalOneShoppingCartDemo

class CartListViewControllerTests: XCTestCase {

    var viewControllerUnderTest: CartListViewController!
    
    override func setUp() {
        super.setUp()
        
        self.viewControllerUnderTest = CartListViewController(with: CartListPresenter(interactor: CartListInteractor(repository: CartsRepository())))
        
        // in view controller, menuItems = ["one", "two", "three"]
        self.viewControllerUnderTest.loadView()
     //   self.viewControllerUnderTest.viewDidLoad()
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
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.cartListView.cartTableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? CartListTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "CartListTableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

    func testTableCellHasCorrectLabelText() {
        let cell0 = viewControllerUnderTest.tableView(viewControllerUnderTest.cartListView.cartTableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? CartListTableViewCell
        XCTAssertEqual(cell0?.productNameLabel.text, "iPhone 9")
        
        let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.cartListView.cartTableView!, cellForRowAt: IndexPath(row: 1, section: 0)) as? CartListTableViewCell
        XCTAssertEqual(cell1?.productNameLabel.text, "iPhone X")
}

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}
