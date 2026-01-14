//
//  StrokeButton.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct StrokeButton: View {
  var text: String
  var strokeColor: Color = .primary
  var closure: () -> Void
  
  var body: some View {
    Button {
      closure()
    } label: {
      Text(text)
        .cygre(.regular)
        .foregroundColor(.primary)
        .padding(.top, 12)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
        .background(
          Capsule()
            .stroke(strokeColor, lineWidth: 2)
        )
        .clipShape(.capsule)
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  StrokeButton(text: "Oayment", strokeColor: .appYellow, closure: {})
}
