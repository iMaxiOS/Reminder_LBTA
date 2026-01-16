//
//  TextFieldView.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 16.01.2026.
//

import SwiftUI

struct TextFieldView: View {
  var title: String
  var isTextEditorView: Bool = true
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(title)
        .cygre(.regular, 16)
      
      if isTextEditorView {
        TextField("", text: .constant(""))
          .cygre(.regular, 16)
          .padding(.vertical, 13)
          .padding(.horizontal, 10)
          .foregroundColor(.secondary)
          .background(.primary.opacity(0.2))
          .clipShape(.rect(cornerRadius: 25))
      } else {
        TextEditor(text: .constant(""))
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
