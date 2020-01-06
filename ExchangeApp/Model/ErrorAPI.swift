//
//  ErrorAPI.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Foundation

struct ErrorAPI: Codable, Error {
    let error: String?
}
