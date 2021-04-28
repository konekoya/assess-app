//
//  RolePicker.swift
//  Assess
//
//  Created by  Joshua on 2021/4/27.
//

import SwiftUI

struct RolePicker: View {
  let roles = ["管理員", "使用者"]
  @State var selectedRole: String
  
  var body: some View {
    Picker("Please choose a role", selection: $selectedRole) {
      ForEach(roles, id: \.self) {
        Text($0)
      }
    }
    .pickerStyle(SegmentedPickerStyle()).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
  }
}

struct RolePicker_Previews: PreviewProvider {
  static var previews: some View {
    RolePicker(selectedRole: "管理員")
      .previewLayout(.fixed(width: 300, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
  }
}
