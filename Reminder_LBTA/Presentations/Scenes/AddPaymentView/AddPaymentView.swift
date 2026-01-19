//
//  AddPaymentView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

enum PayType: Int {
  case oneTime
  case monthly
}

struct AddPaymentView: View {
  
  @StateObject private var vm: AddViewModel = Assembly.createAddViewModel()
  
  var body: some View {
    ZStack {
      Color(.appBack)
        .ignoresSafeArea()
      
      if !vm.isAdded {
        paymentContent
      } else {
        AddSuccessView()
      }
    }
  }
}

#Preview {
  AddPaymentView()
}

private extension AddPaymentView {
  var paymentContent: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 25) {
        Text("Add Payment")
          .cygre(.black, 20)
          .foregroundStyle(.appYellow)
          .padding(.top)
        
        HStack(spacing: 16) {
          SolidButton(text: "Every month", textColor: .appYellow, solidColor: .appYellow, isFull: vm.payType == .monthly) {
            vm.payType = .monthly
          }
          
          SolidButton(text: "One time", textColor: .appYellow, solidColor: .appYellow, isFull: vm.payType == .oneTime) {
            vm.payType = .oneTime
          }
        }
        
        HStack {
          switch vm.payType {
          case .oneTime:
            HStack(spacing: 4) {
              Text("From")
                .cygre(.medium, 14)
                .foregroundStyle(.primary)
              
              DatePicker("", selection: $vm.date, displayedComponents: [.date])
                .frame(width: 150)
                .clipped()
                .overlay {
                  Text(vm.date.dayMonthYear)
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
              DatePicker("", selection: $vm.date, displayedComponents: [.date])
                .frame(width: 25)
                .accentColor(.accent)
                .clipped()
                .overlay {
                  Text("\(vm.date.day)")
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
        
        TextFieldView(placeholder: "Name Payment", textFieldType: .name, text: $vm.paymentName)
        switch vm.payType {
        case .monthly:
          HStack(spacing: 10) {
            TextFieldView(placeholder: "Total payment", textFieldType: .total, text: $vm.totalAmount)
            TextFieldView(placeholder: "Month payment", textFieldType: .payment, text: $vm.paymentAmount)
          }
        case .oneTime:
          TextFieldView(placeholder: "Total payment", textFieldType: .total, text: $vm.totalAmount)
        }
        
        TextFieldView(placeholder: "About", isTextEditorView: false, textFieldType: .about, text: $vm.description)
        
        HStack {
          Text("Payment notifications")
            .cygre(.regular, 14)
            .foregroundStyle(.appYellow)
          
          Spacer()
          
          Button {
            vm.isPaymentNotification.toggle()
          } label: {
            ZStack {
              Circle()
                .stroke(.yellow, lineWidth: 2)
                .frame(width: 25, height: 25)
              Circle()
                .fill(vm.isPaymentNotification ? .appYellow : .clear)
                .frame(width: 16, height: 16)
            }
          }
        }
      }
      .padding(.horizontal, 16)
      .animation(.easeInOut(duration: 0.3), value: vm.payType)

    }
    .padding(.bottom, 60)
    .overlay(alignment: .bottom) {
      SolidButton(text: "Add", textColor: .appBack, solidColor: .appYellow, isFull: true) {
        vm.createNewPayment()
      }
      .padding(.horizontal, 16)
    }

  }
}
