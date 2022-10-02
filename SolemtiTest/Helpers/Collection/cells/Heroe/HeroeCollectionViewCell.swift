//
//  HeroeCollectionViewCell.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//

import UIKit

class HeroeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heroePhoto: UIImageView!
    
    var heroe: Result?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        heroePhoto.image = UIImage(named: "Marvel-Logo-1")
        self.name.text = ""
    }
    
    func config(heroe:Result){
        self.heroe = heroe
        if let myHeroe = self.heroe{
            self.name.text = myHeroe.name
            if let path = self.heroe?.thumbnail?.path, let ext = self.heroe?.thumbnail?.extension {
                let url = path + "." + ext
                self.heroePhoto.uploadImage(url: url)
            }
            
        }
        
    }
    

}
