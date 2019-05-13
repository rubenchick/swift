//
//  TranslateTests.swift
//  TranslateTests
//
//  Created by Anton Rubenchik on 29/04/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import XCTest
@testable import Translate

class TranslateTests: XCTestCase {
    func testSquare() {
      let value  = 3
      let result = value.square()
      XCTAssertEqual(result, 9)
    }
}
