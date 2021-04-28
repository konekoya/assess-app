//
//  Login.swift
//  Assess
//
//  Created by  Joshua on 2021/4/19.
//

import SwiftUI

struct UsernameTextField: View {
  @Binding var username: String
  var body: some View {
    TextField("帳號", text: $username)
      .font(.subheadline)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct PasswordTextField: View {
  @Binding var password: String
  var body: some View {
    SecureField("密碼", text: $password)
      .font(.subheadline)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
}

struct Login: View {
  @State private var username = ""
  @State private var password = ""
  @State var authenticationDidFail = false
  @State var isLinkActive = false
  
  var body: some View {
    VStack{
      Text("登入系統")
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color.black.opacity(0.8))
        .font(.title)
        .padding(.bottom, 30)
      
      UsernameTextField(username: $username)
      PasswordTextField(password: $password)
      
      if authenticationDidFail {
        Text("Information not correct. Try again.")
          .font(.subheadline)
          .foregroundColor(.red)
      }
      
      NavigationLink(destination: Settings(), isActive: $isLinkActive) {
        Button(action: {
          self.isLinkActive = true
        }) {
          Text("登入")
        }
        .foregroundColor(.white)
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(5)
      }.disabled(self.username.isEmpty || self.password.isEmpty)
    }
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
    Login()
  }
}
