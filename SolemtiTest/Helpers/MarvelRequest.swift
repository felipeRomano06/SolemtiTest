//
//  MavelRequest.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//


import UIKit
import Foundation
import Alamofire

class MArvelRequests: NSObject {
    
    static var apikey: String  {
        get{
            
            return "4051892e3bee2f5cadbfcc6ec4e3f4aa"
        }
    }
    
    static var hash: String  {
        get{
            
            return "330c80cf9c19f9f598994b73b35ee6f8"
        }
    }
    
    static var ts: String {
        get{
            let timestamp = Int(NSDate().timeIntervalSince1970)
            let strTs = String(timestamp)
            print("strTs ---->", strTs)
            return "1664550867"
        }
    }
    
    
    static var baseURL: String  {
        get{
            
            return "https://gateway.marvel.com"
        }
    }
   

    public enum ExcelsiorWebRepository: String
    {
        case characters =  "/v1/public/characters"
       
    }
    
    /// Obtiene la url para un repositorio solicitado
    /// - Parameter repository: ExcelsiorWebRepository - Repositorio de excélsior.
    /// - Returns: String con el url completo.
    static func getUrl(_ repository: ExcelsiorWebRepository)-> String {
        
        let url = baseURL + repository.rawValue 
        
        return url
    }
    
    static func SetValues(limit:Int,offset:Int) -> ParameterCaracter{
        
        let params = ParameterCaracter(apikey: apikey, hash: hash, ts: ts, limit: limit, offset: offset)
        
        return params
    }
    
    
   
}

