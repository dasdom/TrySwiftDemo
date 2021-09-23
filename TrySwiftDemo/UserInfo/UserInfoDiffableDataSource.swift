//  Created by Dominik Hauser on 15.09.21.
//  
//

import UIKit

class UserInfoDiffableDataSource: UITableViewDiffableDataSource<UserInfoSection, String> {
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return snapshot().sectionIdentifiers[section].rawValue
  }
}
