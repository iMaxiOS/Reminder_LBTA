//
//  PaymentListView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentListView: View {
  @State private var date: Date = .now
  @Binding var path: NavigationPath
  
  var body: some View {
    ZStack(alignment: .top) {
      PaymentHeaderView(content: .init(amount: "122 546 $", title: "Payments", image: "calendar", pageType: .payments), date: Binding<Date?>(get: { date }, set: { date = $0 ?? date }))
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: 16) {
//          PaymentCardView(path: $path, payment: .init(id: "1", title: "Spotify Premium", type: .monthly, descriptionText: "Family plan for 6 accounts", totalAmount: 120, paymentAmount: 10, dueDay: 15, isNotificationEnable: true, createAt: .now))
//          PaymentCardView(path: $path, payment: .init(id: "2", title: "Spotify Premium", type: .monthly, descriptionText: "Family plan for 12 accounts", totalAmount: 150, paymentAmount: 30, dueDay: 65, isNotificationEnable: true, createAt: .now))
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
  PaymentListView(path: .constant(.init()))
}
