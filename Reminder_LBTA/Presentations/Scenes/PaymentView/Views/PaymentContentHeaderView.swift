//
//  MainContentHeaderView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentContentHeaderView: View {
  @Binding var payType: PayType
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack(spacing: 16) {
        Text("Debts")
          .cygre(.black, 16)
          .foregroundStyle(.appYellow)
        
        Spacer()
        
        Button {
          payType = .monthly
        } label: {
          Text("Monthly")
        }
        .buttonStyle(.plain)
        
        Button {
          payType = .oneTime
        } label: {
          Text("One-Time")
        }
        .buttonStyle(.plain)
      }
      .cygre(.black, 12)
      
      HStack {
        Text("$ 25,555")
          .cygre(.black);
        Text("/  Every month")
          .cygre(.regular)
      }
    }
    .padding(.top, 5)
  }
}

#Preview {
  PaymentContentHeaderView(payType: .constant(.monthly))
}
