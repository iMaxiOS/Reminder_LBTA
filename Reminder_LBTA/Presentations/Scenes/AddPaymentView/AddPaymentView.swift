//
//  AddPaymentView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

enum ChangeState: Int {
  case oneTime
  case monthly
}

struct AddPaymentView: View {
  @State private var isPaymentNotification: Bool = false
  @State private var changeState: ChangeState = .oneTime
  @State private var isShowCalendar: Bool = false
  @State private var date: Date = Date.now
  @State private var viewModel: AddViewModel = Assembly.createAddViewModel()
  
  var body: some View {
    ZStack {
      Color(.appBack)
        .ignoresSafeArea()
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: 25) {
          Text("Add Payment")
            .cygre(.black, 20)
            .foregroundStyle(.appYellow)
            .padding(.top)
          
          HStack(spacing: 16) {
            SolidButton(text: "Every month", textColor: .appYellow, solidColor: .appYellow, isFull: changeState == .monthly) {
              changeState = .monthly
            }
            
            SolidButton(text: "One time", textColor: .appYellow, solidColor: .appYellow, isFull: changeState == .oneTime) {
              changeState = .oneTime
              
            }
          }
          
          HStack {
            switch changeState {
            case .oneTime:
              HStack(spacing: 4) {
                Text("From")
                  .cygre(.medium, 14)
                  .foregroundStyle(.primary)
                
                DatePicker("", selection: $date, displayedComponents: [.date])
                  .frame(width: 150)
                  .clipped()
                  .overlay {
                    Text(date.dayMonthYear)
                      .foregroundStyle(.appYellow)
                      .cygre(.black, 16)
                      .underline()
                      .frame(width: 152)
                      .padding(.vertical, 4)
                      .background(.appBack)
                      .allowsHitTesting(false)
                  }
                
                Spacer()
              }
            case .monthly:
              HStack(spacing: 4) {
                DatePicker("", selection: $date, displayedComponents: [.date])
                  .frame(width: 25)
                  .accentColor(.accent)
                  .clipped()
                  .overlay {
                    Text("\(date.day)")
                      .underline()
                      .cygre(.black, 16)
                      .foregroundStyle(.appYellow)
                      .frame(width: 27)
                      .padding(.vertical, 4)
                      .background(.appBack)
                      .allowsHitTesting(false)
                  }
                
                Text("th")
                  .cygre(.medium, 14)
                  .foregroundStyle(.primary)
                
                
                Spacer()
              }
            }
            
            
          }
          
          TextFieldView(title: "Name Payment")
          switch changeState {
          case .monthly:
            HStack(spacing: 10) {
              TextFieldView(title: "Total payment")
              TextFieldView(title: "Month payment")
            }
          case .oneTime:
            TextFieldView(title: "Total payment")
          }
          
          TextFieldView(title: "About", isTextEditorView: false)
          
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
        .padding(.horizontal, 16)
      }
      .padding(.bottom, 60)
      .overlay(alignment: .bottom) {
        SolidButton(text: "Add", textColor: .appBack, solidColor: .appYellow, isFull: true) {
          viewModel.createNewPayment()
        }
        .padding(.horizontal, 16)
      }
    }
  }
}

#Preview {
  AddPaymentView()
}
