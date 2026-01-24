//
//  PaymentDetailView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct PaymentDetailView: View {
  @Binding var path: NavigationPath
  @StateObject var vm: PaymentDetailViewModel
  
  init(path: Binding<NavigationPath>, vm: PaymentDetailViewModel) {
    self._path = path
    self._vm = StateObject(wrappedValue: vm)
  }
  
  var body: some View {
    ZStack {
      Color(.appBack)
        .ignoresSafeArea()
      
      VStack(alignment: .leading, spacing: 20) {
        highSection
        middleSection
        Spacer()
        solidButtons
      }
      .padding(.horizontal)
      .navigationTitle(Text("Payment Detail"))
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            Task {
              await vm.deletePayment()
              path.removeLast()
            }
          } label: {
            Image(systemName: "trash")
              .tint(.appYellow)
          }
        }
      }
    }
  }
}

private extension PaymentDetailView {
  var highSection: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: -6) {
        Text(vm.payment.totalAmount.formatterWithoutDecimal)
          .cygre(.regular, 27)
          .foregroundStyle(.primary)
        
        Text(vm.payment.title)
          .cygre(.black, 16)
          .foregroundStyle(.appYellow)
      }
      
      VStack(alignment: .leading, spacing: 16) {
        if vm.payment.type == .monthly {
          HStack(spacing: 16) {
            Text(vm.payment.remainingAmount.formatterWithoutDecimal)
              .cygre(.medium, 20)
              .padding([.bottom, .horizontal], 15)
              .padding(.top, 10)
              .overlay {
                Capsule()
                  .stroke(.appYellow, lineWidth: 1)
              }
            
            Text(vm.payment.paymentAmount.formatterWithoutDecimal)
              .cygre(.medium, 20)
              .padding([.bottom, .horizontal], 15)
              .padding(.top, 10)
              .overlay {
                Capsule()
                  .stroke(.appYellow, lineWidth: 1)
              }
          }
          .padding(.top)
        }
        
        Text(vm.payment.descriptionText)
          .lineLimit(3)
          .cygre(.regular, 14)
          .padding(.top)
      }
      .foregroundStyle(.appYellow)
      
    }
  }
  
  var middleSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      RoundedRectangle(cornerRadius: 1)
        .foregroundStyle(.appYellow)
        .frame(height: 1)
      
      PaymentStatus(paymentType: vm.payment.type, dueDate: vm.payment.dueDate, lastPay: vm.payment.lastPay)
      
      RoundedRectangle(cornerRadius: 1)
        .foregroundStyle(.appYellow)
        .frame(height: 1)
      
      HStack {
        Text("Payment notifications")
          .cygre(.regular, 14)
          .foregroundStyle(.appYellow)
        
        Spacer()
        
        ZStack {
          Circle()
            .stroke(.yellow, lineWidth: 2)
            .frame(width: 25, height: 25)
          Circle()
            .fill(vm.payment.isNotificationEnable ? .appYellow : .clear)
            .frame(width: 16, height: 16)
        }
      }
    }
  }
  
  var solidButtons: some View {
    VStack {
      SolidButton(text: "Close early", textColor: .primary, solidColor: .appYellow, isFull: true) {
        Task {
          await vm.closePayment()
        }
        
        path.removeLast()
      }
      
      SolidButton(text: "Delete last payment", textColor: .appYellow, solidColor: .appYellow) {
        Task {
          await vm.deleteLastPayment()
        }
        
        path.removeLast()
      }
    }
  }
}

struct PaymentStatus: View {
  var paymentType: PayType
  var dueDate: Date?
  var lastPay: Date?
  var isShowLabel: Bool = true
  
  var body: some View {
    HStack {
      switch paymentType {
      case .monthly:
        if isShowLabel {
          Text("Upcoming payment")
            .cygre(.regular, 14)
            .foregroundStyle(.appYellow)
          
          Spacer()
        }
        
        if let lastPay = lastPay, lastPay.isInSameMonth(date: .now) {
          HStack {
            Text("Paid")
              .cygre(.regular, 12)
            Text(lastPay.dateMonthString)
              .cygre(.black, 12)
          }
          .foregroundStyle(.primary)
          .padding(.vertical, 1)
          .padding(.horizontal, 15)
          .offset(y: -2)
          .background(.appYellow)
          .clipShape(Capsule())
        } else {
          HStack {
            Text("Pay before")
              .cygre(.regular, 12)
            Text("\(Date().clampedDay(dueDate?.day ?? 0)).\(Date().month)")
              .cygre(.black, 12)
          }
          .foregroundStyle(.primary)
          .padding(.vertical, 1)
          .padding(.horizontal, 15)
          .offset(y: -2)
          .background(.appYellow)
          .clipShape(Capsule())
        }
      case .oneTime:
        if isShowLabel {
          Text("Pay before")
            .cygre(.regular, 14)
            .foregroundStyle(.appYellow)
          
          Spacer()
        }
        
        Text(dueDate?.dateMonthString ?? "")
          .cygre(.black, 12)
          .foregroundStyle(.primary)
          .padding(.vertical, 1)
          .padding(.horizontal, 15)
          .offset(y: -2)
          .background(.appYellow)
          .clipShape(Capsule())
      }
    }
  }
}

#Preview {
  PaymentDetailView(
    path: .constant(.init()),
    vm: Assembly.paymentDetailViewModel(payment: .init(
      id: "1",
      title: "Spotify Premium",
      type: .monthly,
      descriptionText: "Family plan for 6 accounts",
      totalAmount: 120,
      paymentAmount: 10,
      remainingAmount: 10000,
      dueDay: 15,
      isNotificationEnable: true,
      createAt: .now,
      isClose: false,
      closeDate: .now))
  )
}
