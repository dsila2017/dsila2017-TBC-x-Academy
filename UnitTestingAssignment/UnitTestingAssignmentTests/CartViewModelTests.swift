//
//  CartViewModelTests.swift
//  UnitTestingAssignmentTests
//
//  Created by David on 12/4/23.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testSelectedItemQuantity() {
        cartViewModel.fetchProducts()
        cartViewModel.addRandomProduct()
        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 2)
    }
    
    func testTotalPrice() {
        cartViewModel.fetchProducts()
        cartViewModel.addProduct(withID: 1)
        cartViewModel.addProduct(withID: 4)
        XCTAssertEqual(cartViewModel.totalPrice, 829)
        XCTAssertGreaterThan(cartViewModel.totalPrice ?? 0, 0.0)
    }
    
    func testFetchProducts() {
        cartViewModel.fetchProducts()
        XCTAssertEqual(cartViewModel.allproducts?.count, 15)
    }
    
    func testAddRandomItem() {
        cartViewModel.fetchProducts()
        cartViewModel.addRandomProduct()
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testAddItemWithID() {
        cartViewModel.fetchProducts()
        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertTrue(cartViewModel.selectedProducts.contains(where: {$0.id == 1 }))
    }
    
    func testRemoveItemWithID() {
        cartViewModel.fetchProducts()
        cartViewModel.addProduct(withID: 1)
        cartViewModel.removeProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
        XCTAssertFalse(cartViewModel.selectedProducts.contains(where: {$0.id == 1 }))
    }
    
    func testClearCart() {
        cartViewModel.fetchProducts()
        cartViewModel.addRandomProduct()
        cartViewModel.clearCart()
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
}
