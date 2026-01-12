//
//  PaymentHeaderView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//


import SwiftUI

struct PaymentHeaderView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Text("723 455 $")
          .cygre(.regular, 27)
        Spacer()
        Button {
          
        } label: {
          Image(systemName: "plus.circle")
            .foregroundStyle(.appYellow)
            .font(.title)
        }
      }
      
      VStack(alignment: .leading, spacing: -8) {
        Text("Total amounts")
          .cygre(.black, 32)
        Text("15 December")
          .cygre(.regular, 16)
      }
      .foregroundStyle(.appYellow)
      .padding(.bottom, 5)
    }
  }
}

#Preview {
  PaymentHeaderView()
}
