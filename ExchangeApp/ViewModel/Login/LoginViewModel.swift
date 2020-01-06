//
//  LoginViewModel.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 06/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

class LoginViewModel: LoginViewModelProtocol {
    
    var viewDelegate: LoginViewModelProtocolDelegate?
    
    
    func checkLogin(user: String?, password: String?) {
        guard let user_ = user, user_ != "" else {
            self.viewDelegate?.error(message: "Campo de usuário não pode estar vazio.")
            return
        }
        
        guard let password_ = password, password_ != "" else {
            self.viewDelegate?.error(message: "Campo de senha não pode estar vazio.")
            return
        }
        
        self.viewDelegate?.success()
        return
    }
}
