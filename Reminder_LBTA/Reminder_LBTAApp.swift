//
//  Reminder_LBTAApp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

@main
struct Reminder_LBTAApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .onAppear {
          print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first)
        }
    }
  }
}
