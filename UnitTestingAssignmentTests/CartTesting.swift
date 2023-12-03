//
//  CartTesting.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Mchedlidze on 04.12.23.
//

import XCTest

final class CartTesting: XCTestCase {

    var cartViewModel: CartViewModel!
    
    override func setUp()  {
        super.setUp()
        cartViewModel = CartViewModel()
    }
    
    func testAddThreeProductsRemoveOneAddRandomClearCart() {
        let product1 = Product(id: 1, title: "Product1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product2", price: 15.0, selectedQuantity: 1)
        let product3 = Product(id: 3, title: "Product3", price: 20.0, selectedQuantity: 3)

        // MARK: -Step 1: Add Items
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)

        XCTAssertEqual(cartViewModel.selectedProducts.count, 3)
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 6)
        XCTAssertEqual(cartViewModel.totalPrice, 2 * 10.0 + 1 * 15.0 + 3 * 20.0)

        // MARK: -Step 2: Remove 1 Item
        cartViewModel.removeProduct(withID: 2)

        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 5)
        XCTAssertEqual(cartViewModel.totalPrice, 2 * 10.0 + 3 * 20.0)

        // MARK: -Step 3: Remove 1 Item
        cartViewModel.addRandomProduct()

        // Assert after adding a random product
        XCTAssertGreaterThan(cartViewModel.selectedProducts.count, 2)
        XCTAssertGreaterThan(cartViewModel.selectedItemsQuantity!, 5)
        XCTAssertGreaterThan(cartViewModel.totalPrice!, 2 * 10.0 + 3 * 20.0)

        // Step 4: Clear the cart
        cartViewModel.clearCart()

        // MARK: -Step 4: Remove 1 Item
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 0)
        XCTAssertEqual(cartViewModel.totalPrice, 0.0)
    }

}
