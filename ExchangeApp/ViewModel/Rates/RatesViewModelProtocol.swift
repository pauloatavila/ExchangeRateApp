//
//  RatesViewModelProtocol.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 06/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

protocol RatesViewModelProtocolDelegate: class {
    func error(message: String)
    func startLoading()
    func stopLoading()
    func successRates(rates: Rates)
}

protocol RatesViewModelProtocol {
    var viewDelegate: RatesViewModelProtocolDelegate? { get set }
}
