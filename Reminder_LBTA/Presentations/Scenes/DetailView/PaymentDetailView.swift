//
//  PaymentDetailView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct PaymentDetailView: View {
  @Binding var path: NavigationPath
  
  var payment: Payment
  
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
      .navigationTitle(Text("Payment Details"))
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            // remove item
          } label: {
            Image(systemName: "trash")
              .tint(.appYellow)
          }
        }
      }
    }
  }
}

#Preview {
  PaymentDetailView(path: .constant(.init()), payment: .init(id: "1", title: "Spotify Premium", type: .monthly, descriptionText: "Family plan for 6 accounts", totalAmount: 120, paymentAmount: 10, dueDay: 15, isNotificationEnable: true, createAt: .now))
}

private extension PaymentDetailView {
  var highSection: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: -6) {
        Text("231 323 $")
          .cygre(.regular, 27)
          .foregroundStyle(.primary)
        
        Text(payment.title)
          .cygre(.black, 16)
          .foregroundStyle(.appYellow)
      }
      
      VStack(alignment: .leading, spacing: 16) {
        HStack(spacing: 16) {
          Text("$ \(String(format: "%.2f", payment.totalAmount))")
            .cygre(.medium, 20)
            .padding([.bottom, .horizontal], 15)
            .padding(.top, 10)
            .overlay {
              Capsule()
                .stroke(.appYellow, lineWidth: 1)
            }
          
          Text("$ \(String(format: "%.2f", payment.paymentAmount))")
            .cygre(.medium, 20)
            .padding([.bottom, .horizontal], 15)
            .padding(.top, 10)
            .overlay {
              Capsule()
                .stroke(.appYellow, lineWidth: 1)
            }
        }
        .padding(.top)
        
        Text(payment.descriptionText)
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
      
      HStack {
        Text("Upcoming payment")
          .cygre(.regular, 14)
          .foregroundStyle(.appYellow)
        
        Spacer()
        
        HStack {
          Text("paid")
            .cygre(.regular, 12)
          Text("\(payment.dueDay)")
            .cygre(.black, 12)
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 1)
        .padding(.horizontal, 15)
        .offset(y: -2)
        .background(.appYellow)
        .clipShape(Capsule())
      }
      
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
            .fill(payment.isNotificationEnable ? .appYellow : .clear)
            .frame(width: 16, height: 16)
        }
        
      }
    }
  }
  
  var solidButtons: some View {
    VStack {
      SolidButton(text: "Close early", textColor: .primary, solidColor: .appYellow, isFull: true) {
      }
      
      SolidButton(text: "Delete last payment", textColor: .appYellow, solidColor: .appYellow) {
      }
    }
  }
}
