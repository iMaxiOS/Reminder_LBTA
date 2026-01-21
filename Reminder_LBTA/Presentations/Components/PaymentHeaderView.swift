//
//  PaymentHeaderView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 12.01.2026.
//


import SwiftUI

struct HeaderContent {
  var amount: String
  var title: String
  var image: String
  var pageType: PageType
}

struct PaymentHeaderView: View {
  var content: HeaderContent
  var closure: () -> Void = {}
  
  @Binding var date: Date?
  
  private var nonOptionalDateBinding: Binding<Date> {
    Binding<Date>(
      get: { date ?? .now },
      set: { newValue in date = newValue }
    )
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Text(content.amount)
          .cygre(.regular, 27)
        
        Spacer()
        
        switch content.pageType {
        case .main:
          Button {
            closure()
          } label: {
            Image(systemName: content.image)
              .foregroundStyle(.appYellow)
              .font(.title)
          }
          .offset(y: content.pageType == .payments ? 50 : 0)
        case .payments:
          DatePicker("", selection: nonOptionalDateBinding, displayedComponents: [.date])
            .frame(width: 25)
            .accentColor(.accent)
            .clipped()
            .overlay {
              Image(systemName: content.image)
                .foregroundStyle(.appYellow)
                .font(.title)
                .frame(width: 27)
                .padding(.vertical, 4)
                .background(.appBack)
                .allowsHitTesting(false)
            }
          .offset(y: content.pageType == .payments ? 50 : 0)
        }
      }
      
      VStack(alignment: .leading, spacing: -8) {
        Text(content.title)
          .cygre(.black, 32)
        Text(date?.fullDayAndMonthString ?? "")
          .cygre(.regular, 16)
      }
      .foregroundStyle(.appYellow)
      .padding(.bottom, 5)
    }
  }
}

#Preview {
  PaymentHeaderView(content: .init(amount: "34 234 $", title: "Total amounts", image: "plus.circle", pageType: .main), closure: {}, date: .constant(nil))
}

