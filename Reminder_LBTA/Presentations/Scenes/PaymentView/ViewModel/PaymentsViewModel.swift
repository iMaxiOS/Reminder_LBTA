//
//  PaymentsViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 20.01.2026.
//

import Foundation
import Combine

@MainActor
class PaymentsViewModel: ObservableObject {
  @Published var payments: [Payment] = []
  @Published var date: Date = .now
  
  private let useCase: FetchPaymentUseCase
  
  init(useCase: FetchPaymentUseCase) {
    self.useCase = useCase
  }
  
  func fetchPayments() async {
    do {
      let payments = try await useCase.fetchPayments(date: date)
      self.payments = payments
    } catch {
      print(error.localizedDescription)
    }
  }
}
