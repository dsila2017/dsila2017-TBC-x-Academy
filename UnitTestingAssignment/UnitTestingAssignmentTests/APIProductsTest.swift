//
//  CartViewModelTests.swift
//  UnitTestingAssignmentTests
//
//  Created by David on 12/4/23.
//

import XCTest
@testable import UnitTestingAssignment

final class APIProductsTest: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testSelectedItemQuantity() {
        let expectation = XCTestExpectation(description: "API Call")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addRandomProduct()
            cartViewModel.addProduct(withID: 1)
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.selectedItemsQuantity, 2)
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testTotalPrice() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addProduct(withID: 1)
            cartViewModel.addProduct(withID: 4)
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.totalPrice, 829)
            XCTAssertGreaterThan(cartViewModel.totalPrice ?? 0, 0.0)
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testFetchProducts() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.allproducts?.count, 30)
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testAddRandomItem() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addRandomProduct()
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testAddItemWithID() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addProduct(withID: 1)
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
            XCTAssertTrue(cartViewModel.selectedProducts.contains(where: {$0.id == 1 }))
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testRemoveItemWithID() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addProduct(withID: 1)
            cartViewModel.removeProduct(withID: 1)
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
            XCTAssertFalse(cartViewModel.selectedProducts.contains(where: {$0.id == 1 }))
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func testClearCart() {
        let expectation = XCTestExpectation(description: "API Calls")
        cartViewModel.fetchApiProducts{ [self] in
            cartViewModel.addRandomProduct()
            cartViewModel.clearCart()
            expectation.fulfill()
            XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
        }
        wait(for: [expectation], timeout: 20)
    }
}
