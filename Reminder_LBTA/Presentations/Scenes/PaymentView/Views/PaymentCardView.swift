//
//  PaymentCardView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentCardView: View {
  @Binding var path: NavigationPath
  
  var payment: Payment
  var closure: () -> Void
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      VStack(alignment: .leading) {
        Text(payment.title)
          .cygre(.black, 24)
        HStack {
          Text("$ \(String(format: "%.2f", payment.totalAmount - payment.paymentAmount))  /")
            .cygre(.black, 12)
          Text("remainder")
            .cygre(.regular, 12)
        }
      }
      
      Text(payment.descriptionText)
        .cygre(.regular, 14)
      
      HStack {
        Text("$ \(String(format: "%.2f", payment.paymentAmount))  /")
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
          closure()
        }
        
        SolidButton(text: "More details", textColor: .primary, backgroundColor: .clear, solidColor: .primary) {
          closure()
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
  PaymentCardView(
    path: .constant(.init()),
    payment: .init(
      id: "1",
      title: "Spotify Premium",
      type: .monthly,
      descriptionText: "Family plan for 6 accounts",
      totalAmount: 120,
      paymentAmount: 10,
      dueDay: 15,
      isNotificationEnable: true,
      createAt: .now
    ), closure: {}
  )
}
