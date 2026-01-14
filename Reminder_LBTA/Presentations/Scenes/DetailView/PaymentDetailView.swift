//
//  PaymentDetailView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct PaymentDetailView: View {
  @State private var isPaymentNotification: Bool = false
  
  var body: some View {
    ZStack {
      Color(.appBack)
        .ignoresSafeArea()
      
      VStack(alignment: .leading, spacing: 20) {
        HStack {
          Button {} label: {
            Image(systemName: "chevron.left")
              .padding([.vertical, .trailing])
            Spacer()
            Text("Payment Details")
              .cygre(.black, 20)
            Spacer()
            Button {} label: {
              Image(systemName: "trash")
                .padding([.vertical, .leading])
            }
          }
        }
        .foregroundStyle(.appYellow)
        
        VStack(alignment: .leading, spacing: -6) {
          Text("231 323 $")
            .cygre(.regular, 27)
            .foregroundStyle(.primary)
          
          Text("Loan for an iPhone")
            .cygre(.black, 16)
            .foregroundStyle(.appYellow)
        }
        
        VStack(alignment: .leading, spacing: 16) {
          HStack(spacing: 16) {
            Text("60 000 $")
              .cygre(.medium, 20)
              .padding([.bottom, .horizontal], 15)
              .padding(.top, 10)
              .overlay {
                Capsule()
                  .stroke(.appYellow, lineWidth: 1)
              }
            
            Text("3 000 $")
              .cygre(.medium, 20)
              .padding([.bottom, .horizontal], 15)
              .padding(.top, 10)
              .overlay {
                Capsule()
                  .stroke(.appYellow, lineWidth: 1)
              }
          }
          .padding(.top)
          
          Text("If you want a rounded rectangle stroke around the overlay, just stroke the RoundedRectangle or use border(_:width:) on a rounded-corner container")
            .lineLimit(3)
            .cygre(.regular, 14)
        }
        .foregroundStyle(.appYellow)
        
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
          
          RoundedRectangle(cornerRadius: 1)
            .foregroundStyle(.appYellow)
            .frame(height: 1)
          
          HStack {
            Text("Payment notifications")
              .cygre(.regular, 14)
              .foregroundStyle(.appYellow)
            
            Spacer()
            
            Button {
              isPaymentNotification.toggle()
            } label: {
              ZStack {
                Circle()
                  .stroke(.yellow, lineWidth: 2)
                  .frame(width: 25, height: 25)
                Circle()
                  .fill(isPaymentNotification ? .appYellow : .clear)
                  .frame(width: 16, height: 16)
              }
            }
          }
        }
        
        Spacer()
        
        VStack {
          SolidButton(text: "Close early", textColor: .appYellow, solidColor: .appYellow, isFull: true) {
          }
          
          SolidButton(text: "Delete last payment", textColor: .appYellow, solidColor: .appYellow) {
          }
        }
      }
      .padding(.horizontal)
    }
  }
}

#Preview {
  PaymentDetailView()
}
