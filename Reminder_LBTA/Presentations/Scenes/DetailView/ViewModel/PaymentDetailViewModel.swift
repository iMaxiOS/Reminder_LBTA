//
//  DetailViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation
import Combine

class PaymentDetailViewModel: ObservableObject {
  
  var payment: Payment
  
  init(payment: Payment) {
    self.payment = payment
  }
  
  func deletePayment() {
    
  }
  
  func deleteLastPayment() {
    
  }
  
  func closePayment() {
    
  } 
}
