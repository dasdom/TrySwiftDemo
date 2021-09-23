//  Created by Dominik Hauser on 15.09.21.
//  
//

import XCTest
@testable import TrySwiftDemo

class UserInfoViewTests: XCTestCase {

  var sut: UserInfoView!

  override func setUpWithError() throws {
    sut = UserInfoView()
  }

  override func tearDownWithError() throws {
    sut = nil
  }

  func test_shouldHaveTableViewAsSubview() {
    let tableViewIsSubview = sut.tableView.isDescendant(of: sut)

    XCTAssertTrue(tableViewIsSubview)
  }
}
