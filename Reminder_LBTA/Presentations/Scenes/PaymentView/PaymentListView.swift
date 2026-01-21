//
//  PaymentListView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//

import SwiftUI

struct PaymentListView: View {
  @Binding var path: NavigationPath
  
  @StateObject var vm: PaymentsViewModel
  
  var body: some View {
    ZStack(alignment: .top) {
      PaymentHeaderView(content: .init(amount: "122 546 $", title: "Payments", image: "calendar", pageType: .payments), date: Binding<Date?>(get: { vm.date }, set: { vm.date = $0 ?? vm.date }))
      
      ScrollView(showsIndicators: false) {
        LazyVStack(spacing: 16) {
          ForEach(vm.payments) { payment in
            PaymentCardView(path: $path, payment: payment) {
              path.append(NavigationType.detail(payment: payment))
            }
          }
        }
        .padding(.bottom, 10)
      }
      .padding(.top, 120)
    }
    .padding(.horizontal)
    .background(.appBack)
    .onChange(of: vm.date) { newValue in
      Task { await vm.fetchPayments() }
    }
    .task {
      await vm.fetchPayments()
    }
  }
}

#Preview {
  PaymentListView(path: .constant(.init()), vm: Assembly.fetchPayments())
}
