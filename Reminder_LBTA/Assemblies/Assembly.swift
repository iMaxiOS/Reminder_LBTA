//
//  Assembly.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

class Assembly {
  static func fetchPayments() -> MainViewModel {
    let fetchManager = FetchPaymentManager()
    let repository = FetchPaymentRepositoryImp(dataSource: fetchManager)
    let useCase = FetchPaymentUseCaseImp(repository: repository)
    
    let setManager = SetPaymentManager()
    let repo = SetPaymentRepositoryImp(dataSource: setManager)
    let userCase = SetPaymentUseCaseImp(repository: repo)
    
    return MainViewModel(useCase: useCase, setUseCase: userCase)
  }
  
  static func fetchPayments() -> PaymentsViewModel {
    let manager = FetchPaymentManager()
    let repository = FetchPaymentRepositoryImp(dataSource: manager)
    let useCase = FetchPaymentUseCaseImp(repository: repository)
    return PaymentsViewModel(useCase: useCase)
  }
  
  static func createAddViewModel() -> AddViewModel {
    let manager = CreatePaymentManager()
    let repository = CreatePaymentRepositoryImp(dataSource: manager)
    let useCase = CreatePaymentUseCaseImp(repository: repository)
    
    let notificationManager = NotificationManager()
    let notificationRepository = NotificationRepositoryImp(dataSource: notificationManager)
    let notificationUseCase = NotificationUseCaseImp(repository: notificationRepository)
    
    return AddViewModel(createUseCase: useCase, notificationUseCase: notificationUseCase)
  }
  
  static func paymentDetailViewModel(payment: Payment) -> PaymentDetailViewModel {
    
    let updateManager = UpdatePaymentManager()
    let updateRepository = UpdatePaymentRepositoryImp(dataSource: updateManager)
    let updateUseCase = UpdatePaymentUseCaseImp(repository: updateRepository)
    
    
    let deleteManager = DeletePaymentManager()
    let deleteRepository = DeletePaymentRepositoryImp(dataSource: deleteManager)
    let deleteUseCase = DeletePaymentUseCaseImp(repository: deleteRepository)
    
    let notificationManager = NotificationManager()
    let notificationRepository = NotificationRepositoryImp(dataSource: notificationManager)
    let notificationUseCase = NotificationUseCaseImp(repository: notificationRepository)
    
    return PaymentDetailViewModel(
      payment: payment,
      updateUseCase: updateUseCase,
      deleteUseCase: deleteUseCase,
      notificationUseCase: notificationUseCase)
  }
}
