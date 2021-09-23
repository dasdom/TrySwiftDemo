//  Created by Dominik Hauser on 16.09.21.
//  
//

import UIKit

class UsersListCell: UITableViewCell {

  let titleLabel: UILabel
  let nameLabel: UILabel
  let companyLabel: UILabel

  func update(with user: User, using nameFormatter: PersonNameComponentsFormatter) {
    nameLabel.text = nameFormatter.string(from: user.nameComponents)
    titleLabel.text = user.nameComponents.namePrefix
    companyLabel.text = user.company
  }
}
