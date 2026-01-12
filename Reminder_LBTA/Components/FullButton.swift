//
//  FullButton.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct FullButton: View {
  var text: String
  var isStroke: Bool = false
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
          ZStack {
            if isStroke {
              Capsule()
                .fill(.appRed)
              Capsule()
                .stroke(.black, lineWidth: 1)
            } else {
              Capsule()
                .fill(.appBack)
              
            }
          }
        )
        .clipShape(.capsule)
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  FullButton(text: "Pay", closure: { })
    .padding()
}
