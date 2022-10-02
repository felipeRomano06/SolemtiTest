//
//  HeroesRequest.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//

import Foundation

protocol HeroesRequestProtocol: NSObject {
    func getHeroesCatalog(limit: Int, offset: Int, completion: @escaping ([Result]?, CodeResponse?) -> Void)
    
}

class HeroesRequest: NSObject, HeroesRequestProtocol {
    
    
    func getHeroesCatalog(limit: Int = 3, offset: Int = 0, completion: @escaping ([Result]?, CodeResponse?) -> Void) {
        
        let baseURL = MArvelRequests.getUrl(.characters)
        let parameter = MArvelRequests.SetValues(limit: limit, offset: offset)
        
        print("parameter--->",parameter)
   
        RequestManager.make(url: baseURL, metodo: .get, parametros: parameter, completion:  { (data:HeroesCaracters?, code) in
                    
                    switch code {
                    case .ok:
                        print("OK ----->")
                        completion(data?.data?.results, nil)
                        break
                    case .not_connection:
                        print("not_connection")
                        completion(nil, code)
                        break
                    case .none:
                        print("none -----<")
                        completion(nil, code)
                        break
                    case .some(_):
                        print("none------>")
                        completion(nil, code)
                        break
                    }
                    
                })
            }
}
    
    


