//
//  TextFieldView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 16.01.2026.
//

import SwiftUI

struct TextFieldView: View {
  
  enum TextFieldType: Hashable {
    case name
    case payment
    case total
    case about
  }
  
  var placeholder: String
  var isTextEditorView: Bool = true
  var textFieldType: TextFieldType = .name
  
  @Binding var text: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(placeholder)
        .cygre(.regular, 16)
      
      if isTextEditorView {
        TextField("", text: $text)
          .cygre(.regular, 16)
          .padding(.vertical, 13)
          .padding(.horizontal, 10)
          .foregroundColor(.secondary)
          .background(.primary.opacity(0.2))
          .clipShape(.rect(cornerRadius: 25))
          .keyboardType(textFieldType == .name || textFieldType == .about ? .default : .decimalPad)
      } else {
        TextEditor(text: $text)
          .cygre(.regular, 16)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .scrollContentBackground(.hidden)
          .background(.primary.opacity(0.2))
          .clipShape(.rect(cornerRadius: 25))
          .frame(height: 150)
      }
      
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
