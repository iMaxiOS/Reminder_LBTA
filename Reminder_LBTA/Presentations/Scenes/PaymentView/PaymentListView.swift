//
//  PaymentListView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentListView: View {
  var body: some View {
    ZStack(alignment: .top) {
      PaymentHeaderView(content: .init(amount: "122 546 $", title: "Payments", image: "calendar", pageType: .payments)) {
        
      }
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: 16) {
//          PaymentCardView()
//          PaymentCardView()
        }
        .padding(.bottom, 10)
      }
      .padding(.top, 120)
    }
    .padding(.horizontal)
    .background(.appBack)
  }
}


#Preview {
  PaymentListView()
}
