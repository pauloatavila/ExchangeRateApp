//
//  ExchangeRatesEndPoint.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Alamofire

enum ExchangeRatesEndPoint: APIConfiguration {
    
    case latest (base: String)
    
    // HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .latest:
            return .get
        }
    }
    
    // Path
    var path: String {
        switch self {
        case .latest:
            return "/latest"
        }
    }
    
    // MARK: - URL query
    var baseURL: URL{
        switch self {
        case .latest (let base):
            return URL(string: "https://api.exchangeratesapi.io?base=\(base)")!
        }
    }
    
    // Header Parameters
    var headerParameters: [String : String]? {
        switch self {
        case .latest:
            return nil
        }
    }
    
    // Body Parameters
    var parameters: Parameters? {
        switch self {
        case .latest:
            return nil
        }
        
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers Parameter
        headerParameters?.forEach({ headerParameter in
            urlRequest.addValue(headerParameter.value, forHTTPHeaderField: headerParameter.key)
        })
        
        // Body Parameter
        if let parameters = parameters {
            do {
                debugPrint(parameters)
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

