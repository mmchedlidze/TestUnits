//
//  AddProductTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Mchedlidze on 03.12.23.
//

import XCTest

final class AddProductTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUp()  {
        super.setUp()
        cartViewModel = CartViewModel()
    }
    
    func testAddProduct() {
        let product = Product(id: 1, title: "TestProduct", description: "TestDescription", price: 10.0, selectedQuantity: 2)
        
        cartViewModel.addProduct(product: product)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.description, "TestDescription")
        XCTAssertEqual(cartViewModel.selectedProducts.first?.title, "TestProduct")
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 2)
    }
    
    func testAddProductAlreadyExists() {
        let product = Product(id: 1, title: "TestProduct", price: 10.0, selectedQuantity: 2)
        
        cartViewModel.addProduct(product: product)
        cartViewModel.addProduct(product: product)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 4)
    }
    
    func testAddRandomProduct() {
        cartViewModel.addRandomProduct()

        XCTAssertGreaterThan(cartViewModel.selectedProducts.count, 0)
    }
}
