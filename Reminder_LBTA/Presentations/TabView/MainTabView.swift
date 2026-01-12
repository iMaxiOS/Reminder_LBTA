//
//  MainTabView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct MainTabView: View {
  
    init() {
      UITabBar.appearance().isHidden = true
    }
    
  var body: some View {
    TabView {
      PaymentListView()
    }
  }
}

#Preview {
  MainTabView()
}
