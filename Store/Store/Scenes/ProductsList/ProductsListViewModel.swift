//
//  ProductsListViewModel.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import Foundation

protocol ProductsListViewModelDelegate: AnyObject {
    func productsFetched()
    func productsAmountChanged()
}

final class ProductsListViewModel {
    
    weak var delegate: ProductsListViewModelDelegate?
    
    //MARK: - Private Properties
    var products: [ProductModel]?
    var totalPrice: Double? { products?.reduce(0) { $0 + $1.price * Double(($1.selectedAmount ?? 0))} }
    
    func viewDidLoad() {
        fetchProducts()
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] response in
            switch response {
            case .success(let products):
                self?.products = products
                self?.delegate?.productsFetched()
            case .failure(let error):
                //TODO: handle Error
                print(error.localizedDescription)
                break
            }
        }
    }
    
    //MARK: - Methods
    func addProduct(at index: Int) {
        //TODO: handle if products are out of stock
        if let product = products?[index] {
            if product.selectedAmount == nil {
                product.selectedAmount = 1
                delegate?.productsAmountChanged()
            } else {
                checkStock(selected: (product.selectedAmount)!, stock: product.stock) {
                    product.selectedAmount! += 1
                    delegate?.productsAmountChanged()
                }
            }
        }
    }
    
    func removeProduct(at index: Int) {
        //TODO: handle if selected quantity of product is already 0
        if let product = products?[index] {
            if let selectedAmount = product.selectedAmount {
                if selectedAmount > 0 {
                    product.selectedAmount! -= 1
                    delegate?.productsAmountChanged()
                }
            }
        }
    }
    
    private func checkStock(selected: Int, stock: Int, completion: () -> Void) {
        if selected <= stock {
            completion()
        }
    }
}
