//
//  MainView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct MainView: View {
  @StateObject var vm: MainViewModel
  @State private var isShowAddPayment: Bool = false
  @State private var payType: PayType = .monthly
  
    var body: some View {
      ZStack(alignment: .top) {
        PaymentHeaderView(content: .init(amount: "213 546 $", title: "Total amounts", image: "plus.circle", pageType: .main)) {
          isShowAddPayment.toggle()
        }
        
        ScrollView(showsIndicators: false) {
          PaymentContentHeaderView(payType: $payType)
          
          LazyVStack(spacing: 16) {
            switch payType {
            case .monthly:
              ForEach(vm.payments.filter { $0.type == .monthly}) { item in
                PaymentCardView(payment: item)
              }
            case .oneTime:
              ForEach(vm.payments.filter { $0.type == .oneTime}) { item in
                PaymentCardView(payment: item)
              }
            }
          }
          .padding(.bottom, 10)
        }
        .padding(.top, 120)
      }
      .padding(.horizontal)
      .background(.appBack)
      .sheet(isPresented: $isShowAddPayment) {
        AddPaymentView()
      }
      .task {
        await vm.fetchPayments()
      }
    }
}

#Preview {
  MainView(vm: Assembly.fetchPayments())
}
