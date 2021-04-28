//
//  Settings.swift
//  Assess
//
//  Created by  Joshua on 2021/4/19.
//

import SwiftUI

struct Settings: View {
  var body: some View {
    List {
      Section(header: Text("帳號")) {
        HStack{
          Image(systemName: "person.crop.square.fill.and.at.rectangle")
          NavigationLink("個人資訊", destination: UserInfo())
        }
        HStack{
          Image(systemName: "person.2.fill")
          NavigationLink("全部帳號", destination: Users())
        }
        HStack{
          Image(systemName: "person.crop.circle.fill.badge.plus")
          NavigationLink("新增帳號", destination: CreateUser())
        }
      }
      
      Section(header: Text("系統設定")) {
        HStack{
          Image(systemName: "key.fill")
          Text("人力銀行帳密")
        }
        HStack{
          Image(systemName: "cylinder.split.1x2.fill")
          Text("抓取程式設定")
        }
        HStack{
          Image(systemName: "doc.plaintext.fill")
          Text("服務記錄檔")
        }
      }
    }.listStyle(GroupedListStyle()).navigationTitle("設定")
  }
}



struct Settings_Previews: PreviewProvider {
  static var previews: some View {
    Settings()
  }
}

