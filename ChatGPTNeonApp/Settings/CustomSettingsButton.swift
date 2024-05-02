//
//  CustomSettingsButton.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 17.04.2024.
//

import UIKit
import NeonSDK

class CustomSettingsButton: UIButton {
    
    var settingsLabel = UILabel()
    var iconImage = UIImageView()
    var icon = UIImageView()
    var title1 : String?
    var imageTitle : String?
    
    init(title1: String, imageTitle: String) {
        super.init(frame: .zero)
        self.title1 = title1
        self.imageTitle = imageTitle
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        addSubview(settingsLabel)
        addSubview(iconImage)
        addSubview(icon)
        setupConstraints()
    }
    
    private func setupConstraints(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.customGreen.withAlphaComponent(0.3).cgColor
        self.layer.cornerRadius = 16
        self.backgroundColor = .clear
        
        settingsLabel.textColor = .white
        settingsLabel.font = Font.custom(size: 19, fontWeight: .SemiBold)
        settingsLabel.text = title1
        settingsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(60)
        }
        
        iconImage.image = UIImage(named: self.imageTitle!)
        iconImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        icon.image = UIImage(named: "icon_arrowright_black")
        icon.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
}
