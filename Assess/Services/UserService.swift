//
//  UserService.swift
//  Assess
//
//  Created by  Joshua on 2021/4/27.
//

import Foundation
import Alamofire

typealias CompletionHandler<T> = (Result<T, Error>) -> Void

class UserService {
  static let shared = UserService()
  
  let userRoute = "http://localhost:5050/api/_users"
  
  func fetchAll(completion: @escaping CompletionHandler<[User]>) {
    AF.request(userRoute)
      .response { response in
        switch (response.result) {
        
        case .success( _):
          do {
            let users = try JSONDecoder().decode([User].self, from: response.data!)
            completion(.success(users))
          } catch let error as NSError {
            completion(.failure(error))
          }
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
  
  func create(user: User, completion: @escaping CompletionHandler<User>) {
    AF.request(userRoute,
               method: .post,
               parameters: User(name: user.name, username: user.username, password: user.password, role: "User"),
               encoder: JSONParameterEncoder.default)
      .validate()
      .response { response in
        switch (response.result) {
        case .success( _):
          do {
            let user = try JSONDecoder().decode(User.self, from: response.data!)
            completion(.success(user))
          } catch let error as NSError {
            completion(.failure(error))
          }
        case .failure(let error):
          completion(.failure(error))
        }
        
      }
  }
  
  func update(user: User, completion: @escaping CompletionHandler<User>) {
    AF.request("\(userRoute)/\(user.id!)",
               method: .put,
               parameters: user,
               encoder: JSONParameterEncoder.default)
      .validate()
      .response { response in
        switch (response.result) {
        case .success( _):
          do {
            let user = try JSONDecoder().decode(User.self, from: response.data!)
            completion(.success(user))
          } catch let error as NSError {
            completion(.failure(error))
          }
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
}
