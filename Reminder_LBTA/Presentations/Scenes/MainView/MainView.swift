//
//  MainView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct MainView: View {
  @Binding var path: NavigationPath
  
  @StateObject var vm: MainViewModel
  @State private var isShowAddPayment: Bool = false
  @State private var payType: PayType = .monthly
  
  
    var body: some View {
      ZStack(alignment: .top) {
        PaymentHeaderView(content: .init(amount: "213 546 $", title: "Total amounts", image: "plus.circle", pageType: .main), closure: {
          isShowAddPayment.toggle()
        }, date: .constant(.now))
        
        ScrollView(showsIndicators: false) {
          PaymentContentHeaderView(payType: $payType)
          
          LazyVStack(spacing: 16) {
            switch payType {
            case .monthly:
              ForEach(vm.payments.filter { $0.type == .monthly }) { payment in
                PaymentCardView(path: $path, payment: payment) {
                  Task {
                    await vm.set(payment: payment)
                  }
                } moreHandle: {
                  path.append(NavigationType.detail(payment: payment))
                }
              }
            case .oneTime:
              ForEach(vm.payments.filter { $0.type == .oneTime }) { payment in
                PaymentCardView(path: $path, payment: payment) {
                  Task {
                    await vm.set(payment: payment)
                  }
                } moreHandle: {
                  path.append(NavigationType.detail(payment: payment))
                }
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
  MainView(path: .constant(.init()), vm: Assembly.fetchPayments())
}

