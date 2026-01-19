//
//  AddSuccessView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import SwiftUI

struct AddSuccessView: View {
  var body: some View {
    VStack(spacing: 40) {
      Spacer()
      Image(systemName: "checkmark.circle")
        .font(.system(size: 200))
      Text("Payment Added")
        .cygre(.black, 24)
      Spacer()
    }
    .foregroundStyle(.appYellow)
  }
}
