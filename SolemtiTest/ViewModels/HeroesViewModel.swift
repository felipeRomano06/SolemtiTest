//
//  HeroesViewModel.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//

import Foundation
import UIKit


class HeroesViewModel: NSObject {
    
    var heroesServices: HeroesRequestProtocol
    weak var delegate: HeroesProtocol?
    var offset: Int = 0
    var limit: Int = 9
    
    
    init(heroesServices: HeroesRequestProtocol = HeroesRequest(), vc:UIViewController) {
        self.heroesServices = heroesServices
        self.delegate = vc as? HeroesProtocol
    }
    
    
    func getHeroesCatalog(){
        self.delegate?.showLoader()
        heroesServices.getHeroesCatalog(limit: limit, offset: offset, completion: {
            heroes, code in
            
            self.delegate?.hideLoader()
            
            if code == nil {
                self.offset += 9
                if let heroes = heroes {
                    self.delegate?.loadHeroes(heroes: heroes)
                }
            }
            
        })
    }
    
    func loadWebHeroe(urlString:String?){
        
        if let urlString = urlString {
            guard let url = URL(string: urlString) else {
                self.delegate?.hideLoader()
                return
            }
            self.delegate?.webRequest(url: url)
        }
        
    }
  
    
}
