//
//  AddPaymentView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 14.01.2026.
//

import SwiftUI

struct AddPaymentView: View {
    var body: some View {
      ZStack {
        Color(.appBack)
          .ignoresSafeArea()
        
        VStack(spacing: 25) {
          Text("Add Payment")
            .cygre(.black, 20)
            .foregroundStyle(.appYellow)

          HStack(spacing: 16) {
            SolidButton(text: "Every month", textColor: .appYellow, solidColor: .appYellow, isFull: true) {
              
            }
            
            SolidButton(text: "One time", textColor: .appYellow, solidColor: .appYellow) {
              
            }
          }
          
          HStack {
            Text("From").cygre(.black, 16); Text(Date.now, style: .date)
            
              .frame(maxWidth: .infinity, alignment: .leading)
            
          }
          
          TextFieldView(title: "Name Payment")
          HStack(spacing: 10) {
            TextFieldView(title: "Total payment")
            TextFieldView(title: "Month payment")
          }
          TextFieldView(title: "About", isView: false)
          
          Spacer()
        }
        .padding(.horizontal, 16)
      }
    }
}

#Preview {
    AddPaymentView()
}

struct TextFieldView: View {
  var title: String
  var isView: Bool = true
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(title)
        .cygre(.regular, 16)
      
      if isView {
        TextField("", text: .constant(""))
          .cygre(.regular, 16)
          .padding(.vertical, 13)
          .padding(.horizontal, 10)
          .foregroundColor(.secondary)
          .background(.primary)
          .clipShape(.rect(cornerRadius: 25))
      } else {
        TextEditor(text: .constant(""))
          .cygre(.regular, 16)
//          .foregroundColor(.secondary)
//          .background(.primary)
//          .backgroundStyle(.appBack)
          .clipShape(.rect(cornerRadius: 25))
          .frame(height: 150)
      }
      
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
