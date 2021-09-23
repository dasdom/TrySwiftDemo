//  Created by Dominik Hauser on 12.09.21.
//  
//

import Foundation

enum UserRole: String, Codable {
  case owner
  case admin
  case manager
}

struct User: Codable {
  var id = UUID()
  let nameComponents: PersonNameComponents
  let role: UserRole
  let address: String
  let company: String
}
