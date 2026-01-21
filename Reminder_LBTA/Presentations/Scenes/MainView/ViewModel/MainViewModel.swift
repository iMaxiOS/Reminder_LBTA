//
//  MainViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import Foundation
import Combine

@MainActor
class MainViewModel: ObservableObject {
  let useCase: FetchPaymentUseCase
  let setUseCase: SetPaymentUseCase
  
  init(useCase: FetchPaymentUseCase, setUseCase: SetPaymentUseCase) {
    self.useCase = useCase
    self.setUseCase = setUseCase
  }
  
  @Published var payments: [Payment] = []
  
  func fetchPayments() async {
    do {
      let payments = try await useCase.fetchPayments(date: nil)
      self.payments = payments
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func set(payment: Payment) async {
    do {
      try await setUseCase.set(payment: payment)
    } catch {
      print(error.localizedDescription)
    }
  }
}
