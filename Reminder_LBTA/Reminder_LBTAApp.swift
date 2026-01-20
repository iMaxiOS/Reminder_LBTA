//
//  Reminder_LBTAApp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

enum NavigationType: Hashable {
  case detail(payment: Payment)
}

@main
struct Reminder_LBTAApp: App {
  @State private var path: NavigationPath = .init()
  
  var body: some Scene {
    WindowGroup {
      NavigationStack(path: $path) {
        MainTabView(path: $path)
          .navigationDestination(for: NavigationType.self) { item in
            switch item {
            case .detail(let payment):
              PaymentDetailView(path: $path, payment: payment)
            }
          }
      }
    }
  }
}
