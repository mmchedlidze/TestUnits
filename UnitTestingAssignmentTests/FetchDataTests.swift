//
//  FetchDataTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Mchedlidze on 04.12.23.
//

import XCTest

final class FetchDataTests: XCTestCase {
    var cartViewModel: CartViewModel!
       
       override func setUp() {
           super.setUp()
           cartViewModel = CartViewModel()
       }
       
       func testFetchProducts() {
           cartViewModel.fetchProducts()

           XCTAssertNotNil(cartViewModel.allproducts)
           XCTAssertEqual(cartViewModel.allproducts?.count, ProductsResponse.dummyProducts.count)
           XCTAssertEqual(cartViewModel.allproducts?.first?.id, 1)
       }

}
