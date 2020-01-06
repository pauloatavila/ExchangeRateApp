//
//  ExchangeRatesAPI.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 05/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import os.log

class ExchangeRatesAPI: BaseAPIConfiguration {
    static func baseCurrencyRX(base : String) -> Observable<Rates> {
        return Observable.create({ (observable) -> Disposable in
            
            let request = performRequest(route: ExchangeRatesEndPoint.latest(base: base)) { response in
                if response?.response?.statusCode == 200 {
                    
                    if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
                        let json = utf8Text.data(using: .utf8)
                        
                        do {
                            let decoder = JSONDecoder()
                            let decoderJson = try decoder.decode(Rates.self, from: json!)
                            
                            observable.onNext(decoderJson)
                            observable.onCompleted()
                        } catch let error {
                            
                            observable.onError(error)
                        }
                    }
                } else {
                    
                    if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
                        let json = utf8Text.data(using: .utf8)
                        
                        do {
                            let decoder = JSONDecoder()
                            let error = try decoder.decode(ErrorAPI.self, from: json!)
                            
                            observable.onError(error)
                        } catch let error {
                            os_log("Ocorreu um erro ao buscar os dados", type: .error)
                            os_log("API error = %@", error.localizedDescription)
                            observable.onError(error)
                        }
                    }
                    
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
