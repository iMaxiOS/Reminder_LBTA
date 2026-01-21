//
//  MainContentHeaderView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentContentHeaderView: View {
  @Binding var payType: PayType
  @Binding var monthAmount: Decimal
  @Binding var oneTimeMonthAmount: Decimal
  
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
            .foregroundStyle(payType == .monthly ? .primary : .secondary)
            .cygre(payType == .monthly ? .black : .regular)
        }
        .buttonStyle(.plain)
        
        Button {
          payType = .oneTime
        } label: {
          Text("One-Time")
            .foregroundStyle(payType == .oneTime ? .primary : .secondary)
            .cygre(payType == .oneTime ? .black : .regular)
        }
        .buttonStyle(.plain)
      }
      .cygre(.black, 12)
      
      HStack {
        switch payType {
        case .monthly:
          Text("\(monthAmount.formatterWithoutDecimal)")
            .cygre(.black)
          Text("/  Every month")
            .cygre(.regular)
        case .oneTime:
          Text("\(oneTimeMonthAmount.formatterWithoutDecimal)")
            .cygre(.black)
        }
      }
    }
    .padding(.top, 5)
  }
}

#Preview {
  PaymentContentHeaderView(payType: .constant(.monthly), monthAmount: .constant(222), oneTimeMonthAmount: .constant(322))
}
