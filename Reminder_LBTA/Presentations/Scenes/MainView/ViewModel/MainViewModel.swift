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
  
  init(useCase: FetchPaymentUseCase) {
    self.useCase = useCase
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
}
