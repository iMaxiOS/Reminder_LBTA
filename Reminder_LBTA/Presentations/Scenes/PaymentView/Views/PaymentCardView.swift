//
//  PaymentCardView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentCardView: View {
  @State var isPay: Bool
  @Binding var path: NavigationPath
  
  var payment: Payment
  var setHandle: () -> Void
  var moreHandle: () -> Void
  var checkIsPay: Bool {
    !isPay && !(payment.lastPay?.isInSameMonth(date: Date.now) ?? false)
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      VStack(alignment: .leading) {
        Text(payment.title)
          .cygre(.black, 24)
        HStack {
          Text(payment.totalAmount.formatterWithoutDecimal)
            .cygre(.black, 12)
          Text("/ remainder")
            .cygre(.regular, 12)
        }
      }
      
      Text(payment.descriptionText)
        .cygre(.regular, 14)
      
      HStack {
        if payment.type == .monthly {
          Text(payment.paymentAmount.formatterWithoutDecimal)
            .cygre(.black, 18)
          Text("/ Month")
            .cygre(.regular, 18)
        }
        
        Spacer()
        
        PaymentStatus(paymentType: payment.type, dueDate: payment.dueDate, lastPay: payment.lastPay, isShowLabel: false)
      }
      
      HStack {
        if checkIsPay {
          SolidButton(text: "Pay", textColor: Color(.secondarySystemBackground), solidColor: .primary, isFull: true) {
            setHandle()
            isPay.toggle()
          }
        }
        
        SolidButton(text: "More details", textColor: .primary, backgroundColor: .clear, solidColor: .primary) {
          moreHandle()
        }
      }
    }
    .padding(.top, 6)
    .padding([.horizontal, .bottom])
    .background(checkIsPayColor())
    .clipShape(.rect(cornerRadius: 20))
  }
  
  func checkIsPayColor() -> Color {
    if isPay || payment.lastPay?.isInSameMonth(date: Date.now) ?? false {
      return .appMint
    }
    
    return .appRed
  }
}

#Preview {
  PaymentCardView(
    isPay: false,
    path: .constant(.init()),
    payment: .init(
      id: "1",
      title: "Spotify Premium",
      type: .monthly,
      descriptionText: "Family plan for 6 accounts",
      totalAmount: 120,
      paymentAmount: 10,
      remainingAmount: 15,
      dueDay: 15,
      isNotificationEnable: true,
      createAt: .now,
      isClose: false,
      closeDate: .now
    ),
    setHandle: {},
    moreHandle: {}
  )
}
