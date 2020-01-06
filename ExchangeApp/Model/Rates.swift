//
//  Rates.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Foundation

//MARK: Rates
struct Rates: Codable {
    let rates: World
    let base: String
    let date: String
}
