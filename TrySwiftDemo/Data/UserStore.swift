//  Created by Dominik Hauser on 16.09.21.
//  
//

import Foundation

class UserStore {
  func loadUsers() -> [User] {

    guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
      return []
    }

    do {
      let data = try Data(contentsOf: url)
      return try JSONDecoder().decode([User].self, from: data)
    } catch {
      print("\(#file): \(error)")
      return []
    }
  }
}
