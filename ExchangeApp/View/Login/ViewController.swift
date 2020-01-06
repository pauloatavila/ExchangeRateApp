//
//  ViewController.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 04/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = RatesViewModel() {
        willSet {
            viewModel.viewDelegate = nil
        }
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = RatesViewModel()
        
        viewModel.baseCurrency(base: "USD")
    }


}

extension ViewController: RatesViewModelProtocolDelegate {
    func error(message: String) {
        print("deu erro:\n",message)
    }
    
    func startLoading() {
        print("comecou a carregar")
    }
    
    func stopLoading() {
        print("parou de carregar")
    }
    
    func successRates(rates: Rates) {
        print("sucesso:\n", rates)
    }
    
    
}

