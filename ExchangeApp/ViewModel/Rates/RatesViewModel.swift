//
//  RatesViewModel.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 06/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit
import Alamofire

class RatesViewModel: RatesViewModelProtocol {
    
    var viewDelegate: RatesViewModelProtocolDelegate?
    private var disposeBag = DisposeBag()
    
    func baseCurrency(base: String) {
        
        viewDelegate?.startLoading()
        
        ExchangeRatesAPI.baseCurrencyRX(base: base)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { response in
                    self.viewDelegate?.stopLoading()
                    self.viewDelegate?.successRates(rates: response)
                    
            },
                onError: { error in
                    
                    self.viewDelegate?.stopLoading()
                    
                    print("⛔️ ExchangeRatesAPI.baseCurrency: \(error)")
                    self.viewDelegate?.error(message: error.localizedDescription)
                    
            }).disposed(by: disposeBag)
    }
}
