//  Created by Dominik Hauser on 17.09.21.
//  
//

import SwiftUI

struct UserInputView: View {

  @State var name: String = ""
  @State var prefix: String = ""

  var body: some View {
    Form {
      Picker("Prefix", selection: $prefix) {
        Text("Ms").tag(1)
        Text("Mr").tag(2)
        Text("Dr").tag(3)
      }
      TextField("Name", text: $name)
    }
  }

  struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
      UserInputView()
    }
  }
}
