//
//  BaseAPIConfiguration.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Alamofire
import Foundation

class BaseAPIConfiguration {
    
    /**
     Requisição sem token
     */
    @discardableResult
    static func performRequest(route : APIConfiguration, completion : @escaping (DataResponse<Any>?)-> Void) -> DataRequest {
        return AF.request(route, interceptor: LogInterceptor()) .validate(statusCode: 200...207).responseJSON { (response : DataResponse<Any>?) in
            print("\n🔮👤 Result Request: \(response?.description ?? "nil") \n")
            completion(response)
        }
    }
}

