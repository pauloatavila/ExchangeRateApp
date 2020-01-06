//
//  LogInterceptor.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Alamofire

class LogInterceptor: RequestInterceptor {
    
    init() { }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest>) -> Void) {
        
        print("\n\n 🚀 Running request(Log): \n method: [ \(urlRequest.httpMethod ?? "") ] \n host: [ \(urlRequest.url?.absoluteString ?? "") ] \n header: [  \(urlRequest.httpHeaders.description ) ] \n body: [ \( urlRequest.httpBody == nil ? "nil" : "" ) ] ")
        
        completion(.success(urlRequest))
        
    }
}
