//
//  Profile.swift
//  Assess
//
//  Created by  Joshua on 2021/4/20.
//

import SwiftUI
import Alamofire

struct UserInfo: View {
  @State var user = User(name: "", username: "", password: "", role: "Admin")
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text("帳號").font(.callout)
        TextField("name", text: $user.name)
          .font(.subheadline)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
      }
      
      VStack(alignment: .leading) {
        Text("使用者名稱").font(.callout)
        TextField("username", text: $user.username)
          .font(.subheadline)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      
      
      VStack(alignment: .leading) {
        Text("密碼").font(.callout)
        SecureField("password", text: $user.password)
          .font(.subheadline)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      
      RolePicker(selectedRole: self.user.role == "Admin" ? "管理員" : "使用者")
 
      Button("儲存") {
        UserService.shared.update(user: self.user) { (result) in
            switch result {
            case .success(let user):
              presentationMode.wrappedValue.dismiss()
              print(user)
            case .failure(let error): print(error)
            }
          }
      }
      .foregroundColor(.white)
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color.blue)
      .cornerRadius(5)
      Spacer()
    }.padding().navigationTitle("個人資訊")
  }
}


struct Profile_Previews: PreviewProvider {
  static var previews: some View {
    UserInfo()
  }
}
