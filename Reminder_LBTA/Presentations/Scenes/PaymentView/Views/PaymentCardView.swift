//
//  PaymentCardView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentCardView: View {
  var payment: Payment
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      VStack(alignment: .leading) {
        Text(payment.title)
          .cygre(.black, 24)
        HStack {
          Text("$ \(payment.totalAmount - payment.paymentAmount)  /")
            .cygre(.black, 12)
          Text("remainder")
            .cygre(.regular, 12)
        }
      }
      
      Text(payment.descriptionText)
        .cygre(.regular, 14)
      
      HStack {
        Text("$ \(payment.paymentAmount)  /")
          .cygre(.black, 18)
        Text("Month")
          .cygre(.regular, 18)
        Spacer()
        HStack {
          Text("pay before")
            .cygre(.regular, 12)
          Text("\(payment.dueDay)")
            .cygre(.black, 12)
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 1)
        .padding(.horizontal, 15)
        .offset(y: -2)
        .background(.appYellow)
        .clipShape(Capsule())
      }
      
      HStack {
        SolidButton(text: "Pay", textColor: Color(.secondarySystemBackground), solidColor: .primary, isFull: true) {
          
        }
        
        SolidButton(text: "More details", textColor: .primary, backgroundColor: .clear, solidColor: .primary) {
          
        }
      }
    }
    .padding(.top, 6)
    .padding([.horizontal, .bottom])
    .background(.appRed)
    .clipShape(.rect(cornerRadius: 20))
  }
}

#Preview {
  PaymentCardView(payment: .init(id: "1", title: "title", type: .monthly, descriptionText: "description", totalAmount: 100, paymentAmount: 10, dueDay: -1, isNotificationEnable: true, createAt: .now))
}
