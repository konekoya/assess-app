//
//  User.swift
//  Assess
//
//  Created by  Joshua on 2021/4/23.
//

import Foundation

struct User: Encodable, Decodable, Identifiable {
  var id: String?
  var name: String
  var username: String
  var password: String
  var role: String
}
