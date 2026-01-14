//
//  MainTabView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

enum TabType: Hashable {
  case main
  case payments
}

struct MainTabView: View {
  
  @State private var selected: TabType = .main
  
  var body: some View {
    TabView(selection: $selected) {
      MainView()
        .tabItem {
          Label("Main", systemImage: "house")
        }
      
      PaymentListView()
        .tabItem {
          Label("Payment", systemImage: "list.bullet.clipboard")
        }
    }
    .accentColor(.appYellow)
  }
}

#Preview {
  MainTabView()
}
