//
//  HereoView.swift
//  SolemtiTest
//
//  Created by Felipe Romano on 30/09/22.
//

import UIKit
import WebKit

class HereoView: UIViewController {
   
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var webView: WKWebView!
    var hereo: Result!
    
    lazy var heroeviewModel = {
        HeroesViewModel(vc: self)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(self.spinner)
        self.spinner.startAnimating()
        self.webViewInit()
        self.heroeviewModel.loadWebHeroe(urlString: hereo.urls?[0].url)
        
    }
    
    /// metodo que inicializa el WKWebView
    private func webViewInit(){
        webView = WKWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }

}

extension HereoView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish------>")
        self.hideLoader()
    }
    
}

extension HereoView: HeroesProtocol{
    
    /// carga url en webview
    /// - Parameter url: informacion del heroe contenida en un webview
    func webRequest(url:URL) {
        webView.load(URLRequest(url: url))
    }
    
    /// muestra loader
    func showLoader() {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
        }
        
    }
    
    /// oculta loader
    func hideLoader() {
        DispatchQueue.main.async {
            self.spinner.isHidden = true
        }
    }
    
}

extension HeroesProtocol{
    
    /// optional method
    func loadHeroes(heroes: [Result]) {
    }
    /// optional method
    func webRequest(url:URL) {
    }
    
}
