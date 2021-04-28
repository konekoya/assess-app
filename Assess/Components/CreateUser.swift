//
//  CreateUser.swift
//  Assess
//
//  Created by  Joshua on 2021/4/20.
//

import SwiftUI
import Alamofire

struct CreateUser: View {
  @State private var name = ""
  @State private var username = ""
  @State private var password = ""
  @State private var confirmPassword = ""
  @Environment(\.presentationMode) var presentationMode
  
  @State private var submissionError = ""
  
  var body: some View {
    VStack {
      TextField("帳號", text: $name)
        .font(.subheadline)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      TextField("使用者名稱", text: $username)
        .font(.subheadline)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      SecureField("密碼", text: $password)
        .font(.subheadline)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      SecureField("確認密碼", text: $confirmPassword)
        .font(.subheadline)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      // You can only create a "User" not an "Admin" from our UI
      RolePicker(selectedRole: "使用者")
      
      if !submissionError.isEmpty {
        Text(submissionError).foregroundColor(.red)
      }
      
      Button(action: {
        UserService.shared.create(user: User(name: name, username: username, password: password, role: "User")) {
          (result) in
          switch result {
            case .success(let user):
              print(user)
              presentationMode.wrappedValue.dismiss()
            case .failure(let error):
              print(error)
          }
        }
      }) {
        Text("儲存")
      }
      .foregroundColor(.white)
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color.blue)
      .cornerRadius(5)
      Spacer()
    }.padding().navigationTitle("新增帳號")
  }
}

struct CreateUser_Previews: PreviewProvider {
  static var previews: some View {
    CreateUser()
  }
}
