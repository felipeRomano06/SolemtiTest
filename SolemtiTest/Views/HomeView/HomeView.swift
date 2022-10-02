//
//  HomeView.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//

import UIKit

protocol HeroesProtocol:AnyObject {
    func showLoader()
    func hideLoader()
    func loadHeroes(heroes:[Result])
    func webRequest(url: URL)
}

class HomeView: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    lazy var heroeviewModel = {
        HeroesViewModel(vc: self)
    }()
    
    var heroes: [Result] = []
    var isUpdating = false
    var isFullCards = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinner.startAnimating()
        heroeviewModel.getHeroesCatalog()
        self.registerCells()

    }
    
    /// inicializa y registra celda HeroeCollectionViewCell para el collectionView
    private func registerCells(){
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        collectionView.register(UINib.init(nibName: "HeroeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HeroeCollectionViewCell")
        
    }

}

extension HomeView: HeroesProtocol {
    
    /// metodo para cargar la lista de heroues
    /// - Parameter [Result]: lista de hereos
    func loadHeroes(heroes: [Result]) {
        isUpdating = false
        self.heroes.append(contentsOf: heroes)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    ///metodo para ocultar loader
    func showLoader() {
        self.spinner.isHidden = false
        
    }
    ///metodo para mostrar loader
    func hideLoader() {
        self.spinner.isHidden = true
    }
    
}

extension HomeView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HereoView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HereoView") as! HereoView
        vc.hereo = heroes[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if !isUpdating && !isFullCards{
            if position > collectionView.contentSize.height - scrollView.frame.size.height{
                print("Llego al final")
                isUpdating = true
                if self.heroes.count != 0 {
                    heroeviewModel.getHeroesCatalog()
                    
                }
            }
            
        }
        
    }
    
}

extension HomeView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroeCollectionViewCell", for: indexPath) as! HeroeCollectionViewCell
        celda.config(heroe: heroes[indexPath.row])
        
        return celda
        
    }
    
    
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: (collectionView.bounds.height/2))
    }
}
