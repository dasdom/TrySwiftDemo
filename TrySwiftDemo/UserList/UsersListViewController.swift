//  Created by Dominik Hauser on 16.09.21.
//  
//

import UIKit

class UsersListViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  var users: [User] = []
  let nameFormatter = PersonNameComponentsFormatter()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.delegate = self

    users = UserStore().loadUsers()

    print("Users: \(users)")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if let selectedIndexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedIndexPath, animated: true)
    }
//    transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
//      if let selectedIndexPath = self?.tableView.indexPathForSelectedRow {
//        self?.tableView.deselectRow(at: selectedIndexPath, animated: false)
//      }
//    }, completion: nil)
  }
}

extension UsersListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListCell", for: indexPath) as! UsersListCell

    cell.update(with: users[indexPath.row], using: nameFormatter)

    return cell
  }
}

extension UsersListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = users[indexPath.row]
    let next = UserInfoViewController(user: user)
    navigationController?.pushViewController(next, animated: true)
  }
}
