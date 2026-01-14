//
//  PaymentCardView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentCardView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      VStack(alignment: .leading) {
        Text("Debts for credit")
          .cygre(.black, 24)
        HStack {
          Text("$ 32,500  /")
            .cygre(.black, 12)
          Text("remainder")
            .cygre(.regular, 12)
        }
      }
      
      Text("This course will help you to get a job in 3 months.")
        .cygre(.regular, 14)
      
      HStack {
        Text("$ 32,500  /")
          .cygre(.black, 18)
        Text("Month")
          .cygre(.regular, 18)
        Spacer()
        HStack {
          Text("pay before")
            .cygre(.regular, 12)
          Text("21.12")
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
        SolidButton(text: "Pay", textColor: .appYellow, solidColor: .appYellow, isFull: true) {
          
        }
        
        SolidButton(text: "More details", textColor: .appYellow, solidColor: .appYellow) {
          
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
  PaymentCardView()
}
