//
//  Assembly.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

class Assembly {
  static func createMainViewModel() {
    
  }
  
  static func createAddViewModel() -> AddViewModel {
    let manager = CreatePaymentManager()
    let repository = CreatePaymentRepositoryImp(dataSource: manager)
    let useCase = CreatePaymentUseCaseImp(repository: repository)
    return AddViewModel(createUseCase: useCase)
  }
}
