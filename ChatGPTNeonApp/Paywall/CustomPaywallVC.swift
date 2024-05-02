//
//  CustomPaywallVC.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 17.04.2024.
//

import UIKit
import NeonSDK

class CustomPaywallVC: UIButton {
    
    var firstLabel = UILabel()
    var priceLabel = UILabel()
    var selectedImage = UIImageView()
    var title: String?
    var subtitle: String?
    
    var isSelectedButton: Bool = false {
        didSet {
            selectedImage.image = isSelectedButton ? UIImage(named: "icon_selected") : UIImage(named: "icon_unselected")
            self.layer.borderColor = isSelectedButton ? UIColor.customGreen.cgColor : UIColor.gray.withAlphaComponent(0.3).cgColor
            
            firstLabel.textColor = isSelectedButton ? UIColor.white : UIColor.white
            priceLabel.textColor = isSelectedButton ? UIColor.white : UIColor.white
        }
    }
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        self.title = title
        self.subtitle = subtitle
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        addSubview(firstLabel)
        addSubview(priceLabel)
        addSubview(selectedImage)
            
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.customGreen.withAlphaComponent(0.3).cgColor
        self.layer.cornerRadius = 16
        self.backgroundColor = .clear
        
        firstLabel.textColor = .white
        firstLabel.font = Font.custom(size: 18, fontWeight: .SemiBold)
        firstLabel.text = title
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.textColor = .white
        priceLabel.font = Font.custom(size: 15, fontWeight: .SemiBold)
        priceLabel.text = subtitle
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
        }
        
        selectedImage.image = UIImage(named: "icon_unselected")
        selectedImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func toogleSelection(){
        isSelected = !isSelected
    }
    
}
