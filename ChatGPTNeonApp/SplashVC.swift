//
//  SplashVC.swift
//  ChatGptAppt
//
//  Created by Mustafa Kemal ARDA on 15.04.2024.
//

import Foundation
import UIKit

class SplashVC: UIViewController {
    
    let splashImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        createUI()
    }
    
    func createUI(){
        
        view.addSubview(splashImage)
        splashImage.image = UIImage(named: "Splash 1")
        splashImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
}

