//
//  UnitTestForNewtworkingClass.swift
//  UnitTestingAssignmentTests
//
//  Created by David on 12/4/23.
//

import XCTest
@testable import UnitTestingAssignment

class ProductsResponse: Decodable {
    
    var products: [Product]
}

class Product: Decodable {
    
    var id: Int?
    var title: String?
    var description: String?
    var price: Double?
    var selectedQuantity: Int? = 0
    
    init(id: Int? = nil, title: String? = nil, description: String? = nil, price: Double? = nil, selectedQuantity: Int? = 0) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.selectedQuantity = selectedQuantity
    }
}

class MovieAPITests: XCTestCase {

    func testFetchMovies() {
        let expectation = self.expectation(description: "Fetching products from API")

        let apiUrl = URL(string: "https://dummyjson.com/products")!

        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            
            XCTAssertNil(error, "მოხდა შეცდომა: \(error?.localizedDescription ?? "")")
            XCTAssertNotNil(data, "არ გვაქვს დატა")
            
            do {
                let decoder = JSONDecoder()
                let productResponse = try decoder.decode(ProductsResponse.self, from: data!)
                
                XCTAssertFalse(productResponse.products.isEmpty, "არ გვაქვს პროდუქტები")

                for product in productResponse.products {
                    //print(product.id, "xxxx")
                    XCTAssertNotNil(product.id, "id არ უნდა იყოს nil")
                }
                
                expectation.fulfill()
            } catch {
                XCTFail("ვერ მოხდა დეკოდირება: \(error.localizedDescription)")
            }
        }.resume()

        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
