//
//  World.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Foundation

//MARK: World
/**
 Contêma a cotação de todos os países disponíveis na API. Possibita valor nulo para caso a API não forneça algum dos valores, os outros continuam funcionando.
 */
struct World: Codable {
    let CAD: Float?
    let HKD: Float?
    let ISK: Float?
    let PHP: Float?
    let DKK: Float?
    let HUF: Float?
    let CZK: Float?
    let GBP: Float?
    let RON: Float?
    let SEK: Float?
    let IDR: Float?
    let INR: Float?
    let BRL: Float?
    let RUB: Float?
    let HRK: Float?
    let JPY: Float?
    let THB: Float?
    let CHF: Float?
    let EUR: Float?
    let MYR: Float?
    let BGN: Float?
    let TRY: Float?
    let CNY: Float?
    let NOK: Float?
    let NZD: Float?
    let ZAR: Float?
    let USD: Float?
    let MXN: Float?
    let SGD: Float?
    let AUD: Float?
    let ILS: Float?
    let KRW: Float?
    let PLN: Float?
}
