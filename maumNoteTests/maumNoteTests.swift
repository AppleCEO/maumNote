//
//  maumNoteTests.swift
//  maumNoteTests
//
//  Created by joon-ho kil on 2020/05/27.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import XCTest
@testable import maumNote

class maumNoteTests: XCTestCase {
  var viewReactorTest: ViewReactor!
  var memo: [Memo]!
  
  override func setUp() {
    viewReactorTest = ViewReactor()
    memo = [Memo(title: "Welcome to Texture-KR", content: ""), Memo(title: "Welcome to Texture-KR", content: ""), Memo(title: "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", content: "")]
  }
  
  override func tearDown() {
    viewReactorTest = nil
    memo = nil
  }
  
  func testInitialMemo() {
    XCTAssertEqual(viewReactorTest.currentState.memos, memo)
  }
}
