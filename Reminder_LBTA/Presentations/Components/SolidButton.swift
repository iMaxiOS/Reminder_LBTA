//
//  FullButton.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct SolidButton: View {
  var text: String
  var textColor: Color
  var backgroundColor: Color = .appBack
  var solidColor: Color
  var isFull: Bool = false
  var closure: () -> Void
  
  var body: some View {
    Button {
      closure()
    } label: {
      Text(text)
        .cygre(.regular)
        .padding(.top, 12)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
        .foregroundColor(isFull ? .appBack : textColor)
        .background(isFull ? solidColor : backgroundColor)
        .clipShape(.capsule)
        .overlay {
          Capsule()
            .stroke(solidColor, lineWidth: 1)
        }
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  SolidButton(text: "Payment", textColor: .appBack, solidColor: .appYellow, closure: { })
    .padding()
}
