//
//  Users.swift
//  Assess
//
//  Created by  Joshua on 2021/4/20.
//

import SwiftUI
import Alamofire

struct Users: View {
  @State var users = [User]()
  
  var body: some View {
    List {
      ForEach(users) {
        user in HStack {
          let startIndex = user.username.index(user.username.startIndex, offsetBy: 0)
          let endIndex = user.username.index(user.username.startIndex, offsetBy: 1)
          
          Text(String(user.username[startIndex...endIndex]).uppercased())
            .frame(width: 40, height: 40)
            .overlay(
              Circle()
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ).padding()
          
          VStack(alignment: .leading) {
            NavigationLink(user.username, destination: UserInfo(user: user))

            HStack {
              Text(user.name).foregroundColor(.gray)
              if user.role == "Admin" {
                Image(systemName: "person.crop.square.fill.and.at.rectangle")
                  .resizable()
                  .frame(width: 30, height: 25)
                  .foregroundColor(.accentColor)
              }
            }
            
          }
        }
      }
    }.navigationTitle("全部帳號").onAppear {
      UserService.shared.fetchAll {(result) in
        switch result {
        case .success(let users): self.users = users
        case .failure(let error): print(error)
        }
      }
    }
  }
}

struct Users_Previews: PreviewProvider {
  static var previews: some View {
    Users(users: [
      User(id: "123", name: "vero", username: "Vero Code", password: "abc", role: "Admin"),
      User(id: "456", name: "royalroad", username: "Royal Road", password: "efg", role: "User")
    ])
  }
}
