//  Created by Dominik Hauser on 12.09.21.
//  
//

import UIKit

enum UserInfoSection: String, CaseIterable {
  case name = "Name"
  case title = "Title"
  case address = "Address"
  case company = "Company"
}

class UserInfoViewController: UIViewController {

  var dataSource: UserInfoDiffableDataSource?
  let user: User

  init(user: User) {

    self.user = user

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    let contentView = UserInfoView()

    contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    dataSource = UserInfoDiffableDataSource(tableView: contentView.tableView, cellProvider: { tableView, indexPath, string in
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = string
      return cell
    })

    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let personNameCompnentsFormatter = PersonNameComponentsFormatter()
    personNameCompnentsFormatter.style = .default

    var snapsot = NSDiffableDataSourceSnapshot<UserInfoSection, String>()

    snapsot.appendSections([.name])
    snapsot.appendItems([personNameCompnentsFormatter.string(from: user.nameComponents)])

    if let prefix = user.nameComponents.namePrefix {
      snapsot.appendSections([.title])
      snapsot.appendItems([prefix])
    }

    snapsot.appendSections([.address])
    snapsot.appendItems([user.address])

    snapsot.appendSections([.company])
    snapsot.appendItems([user.company])

    dataSource?.apply(snapsot)
  }
}
