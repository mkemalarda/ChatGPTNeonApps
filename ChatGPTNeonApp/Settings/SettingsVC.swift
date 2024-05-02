//
//  SettingsVC.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 17.04.2024.
//

import UIKit
import NeonSDK

class SettingsVC: UIViewController {

    let backButton = UIButton()
    let settingsLabel = UILabel()
    let getPremiumView = UIView()
    let circleView = UIView()
    let diamond = UIImageView()
    let getLabel = UILabel()
    let whiteIcon = UIButton()
    
    // Fix icon names ex. -> rateUsButton
    let icon1 = CustomSettingsButton(title1: "Rate US", imageTitle: "icon_rateus")
    let icon2 = CustomSettingsButton(title1: "Contact Us", imageTitle: "icon_contactus")
    let icon3 = CustomSettingsButton(title1: "Privacy Policy", imageTitle: "icon_privacypolicy")
    let icon4 = CustomSettingsButton(title1: "Terms of Use", imageTitle: "icon_termsofuse")
    let icon5 = CustomSettingsButton(title1: "Restore Purchase", imageTitle: "icon_restorepurchase")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        createUI()

//        self.view.addSubview(view)
        
    }
    
    func createUI(){
        
        backButton.setImage(UIImage(named: "icon_arrowleft"), for: .normal)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(20)
        }
        
        settingsLabel.text = "Settings"
        settingsLabel.font = Font.custom(size: 20, fontWeight: .Bold)
        settingsLabel.textColor = .white
        view.addSubview(settingsLabel)
        settingsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        getPremiumView.backgroundColor = .customGreen
        getPremiumView.layer.cornerRadius = 20
        view.addSubview(getPremiumView)
        getPremiumView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(settingsLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(320)
            make.height.equalTo(75)
        }
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(getPremiumTapped(_:)))
         
         getPremiumView.addGestureRecognizer(tap)
        
        circleView.backgroundColor = .systemGreen
        circleView.layer.cornerRadius = 30
        getPremiumView.addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
            make.height.width.equalTo(65)
        }
        
        diamond.image = UIImage(named: "img_diamond")
        circleView.addSubview(diamond)
        diamond.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        getLabel.text = "Get Premium!"
        getLabel.font = Font.custom(size: 20, fontWeight: .Bold)
        getLabel.textColor = .white
        getPremiumView.addSubview(getLabel)
        getLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(circleView.snp.right).offset(20)
        }
        
        
        whiteIcon.setImage(UIImage(named: "icon_arrowright"), for: .normal)
        getPremiumView.addSubview(whiteIcon)
        whiteIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
        
        view.addSubview(icon1)
        icon1.layer.cornerRadius = 20
        icon1.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        icon1.snp.makeConstraints { make in
            make.top.equalTo(getPremiumView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(370)
            make.height.equalTo(70)
        }
        view.addSubview(icon2)
        icon2.layer.cornerRadius = 0
        icon2.snp.makeConstraints { make in
            make.top.equalTo(icon1.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(370)
            make.height.equalTo(70)
        }
        
        view.addSubview(icon3)
        icon3.layer.cornerRadius = 0
        icon3.snp.makeConstraints { make in
            make.top.equalTo(icon2.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(370)
            make.height.equalTo(70)
        }
        
        view.addSubview(icon4)
        icon4.layer.cornerRadius = 0
        icon4.snp.makeConstraints { make in
            make.top.equalTo(icon3.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(370)
            make.height.equalTo(70)
        }
        
        view.addSubview(icon5)
        icon5.layer.cornerRadius = 20
        icon5.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        icon5.snp.makeConstraints { make in
            make.top.equalTo(icon4.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(370)
            make.height.equalTo(70)
        }

    }
    
    @objc func backTapped(){
        present(destinationVC: HomeVC(), slideDirection: .left)
    }
    
    @objc func getPremiumTapped(_ gesture: UITapGestureRecognizer){
        present(destinationVC: PaywallVC(), slideDirection: .right)
    }
}

