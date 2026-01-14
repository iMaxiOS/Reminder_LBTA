//
//  MainView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      ZStack(alignment: .top) {
        PaymentHeaderView(content: .init(amount: "213 546 $", title: "Total amounts", image: "plus.circle", pageType: .main)) {
          
        }
        
        ScrollView(showsIndicators: false) {
          PaymentContentHeaderView()
          
          VStack(spacing: 16) {
            PaymentCardView()
            PaymentCardView()
            PaymentCardView()
            PaymentCardView()
            PaymentCardView()
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
    MainView()
}
