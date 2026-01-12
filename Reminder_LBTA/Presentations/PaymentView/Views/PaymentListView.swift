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
      PaymentHeaderView()
      
      ScrollView(showsIndicators: false) {
        PaymentContentHeaderView()
        
        VStack(spacing: 16) {
          PaymentCardView()
          PaymentCardView()
          PaymentCardView()
          PaymentCardView()
        }
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
