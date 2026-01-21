//
//  MainTabView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

enum PageType: Hashable {
  case main
  case payments
}

struct MainTabView: View {
  @Binding var path: NavigationPath
  
  @State private var selected: PageType = .main
  
  var body: some View {
    TabView(selection: $selected) {
      MainView(path: $path, vm: Assembly.fetchPayments())
        .tabItem {
          Label("Main", systemImage: "house")
        }
      
      PaymentListView(path: $path, vm: Assembly.fetchPayments())
        .tabItem {
          Label("Payments", systemImage: "list.bullet.clipboard")
        }
    }
    .tint(.accent)
  }
}

#Preview {
  MainTabView(path: .constant(.init()))
}
