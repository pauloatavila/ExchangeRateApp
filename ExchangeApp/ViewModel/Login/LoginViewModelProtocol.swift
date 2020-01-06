//
//  LoginViewModelProtocol.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 06/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

protocol LoginViewModelProtocolDelegate: class {
    func error(message: String)
    func success()
}

protocol LoginViewModelProtocol {
    var viewDelegate: LoginViewModelProtocolDelegate? { get set }
}
