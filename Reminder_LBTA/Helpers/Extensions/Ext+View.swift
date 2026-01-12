//
//  Ext+View.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

extension View {
  
  func cygre(_ font: Cygre = .regular, _ size: CGFloat = 14) -> some View {
    self
      .font(.custom(font.rawValue, size: size))
  }
}

