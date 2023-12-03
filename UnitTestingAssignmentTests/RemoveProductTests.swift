//
//  RemoveProductTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Mchedlidze on 04.12.23.
//

import XCTest

final class RemoveProductTests: XCTestCase {

    var cartViewModel: CartViewModel!

    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    func testRemoveProduct() {
        let product = Product(id: 1, title: "TestProduct", price: 10.0, selectedQuantity: 2)
        cartViewModel.addProduct(product: product)
        
        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    func testRemoveOneProduct() {
        let product1 = Product(id: 1, title: "TestProduct1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "TestProduct2", price: 15.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)

        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, 2)
    }
    
    func testRemoveOnePieceOfProduct() {
        let product = Product(id: 1, title: "TestProduct", price: 10.0, selectedQuantity: 3)
        
        cartViewModel.addProduct(product: product)
        
        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 2)
    }

    func testClearCartWithMultipleProducts() {
        let product1 = Product(id: 1, title: "TestProduct1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "TestProduct2", price: 15.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        
        cartViewModel.clearCart()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
}
