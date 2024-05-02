//
//  GetPremiumVC.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 17.04.2024.
//

import UIKit
import NeonSDK

class GetPremiumVC: UIViewController {
    
    let closeButton = UIButton()
    let chatGPTLabel = UILabel()
    let subtitleLabel = UILabel()
    let lockImage = UIImageView()
    let lockLabel = UILabel()
    let getView = UIView()
    let iconPointImage = UIImageView()
    let title1 = UILabel()
    let subtitle1 = UILabel()
    let iconPointImage2 = UIImageView()
    let title2 = UILabel()
    let subtitle2 = UILabel()
    let tryButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        
        createUI()
        
    }
    
    func createUI(){
        
        closeButton.setImage(UIImage(named: "icon_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().inset(20)
        }
        
        chatGPTLabel.text = "ChatGPT"
        chatGPTLabel.font = Font.custom(size: 36, fontWeight: .Bold)
        chatGPTLabel.textColor = .white
        view.addSubview(chatGPTLabel)
        chatGPTLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(117)
            
        }
        
        subtitleLabel.text = "Unlimited chat with gpt for only, Try It Now."
        subtitleLabel.font = Font.custom(size: 22, fontWeight: .SemiBold)
        subtitleLabel.textColor = .white
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(chatGPTLabel.snp.bottom).offset(34)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(22)
        }
        
        lockImage.image = UIImage(named: "icon_lock")
        view.addSubview(lockImage)
        lockImage.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.height.width.equalTo(50)
            make.leading.equalTo(80)
        }
        
        lockLabel.text = "Unlock to continue"
        lockLabel.font = Font.custom(size: 19, fontWeight: .SemiBold)
        lockLabel.textColor = .white
        view.addSubview(lockLabel)
        lockLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(62)
            make.left.equalTo(lockImage.snp.right).offset(5)
        }
        
        getView.backgroundColor = .clear
        getView.layer.borderColor = UIColor.customGreen.cgColor
        getView.layer.borderWidth = 1
        getView.layer.cornerRadius = 20
        view.addSubview(getView)
        getView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lockImage.snp.bottom).offset(20)
            make.width.equalTo(350)
            make.height.equalTo(340)
        }
        
        iconPointImage.image = UIImage(named: "icon_point")
        getView.addSubview(iconPointImage)
        iconPointImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(60)
        }
        
        title1.text = "Lorem ipsum dolor sit amet."
        title1.font = Font.custom(size: 18, fontWeight: .Bold)
        title1.textColor = .white
        getView.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.leading.equalToSuperview().offset(80)
            
        }
        
        subtitle1.text = "Lorem ipsum dolor sit amet consectetur. Nec sollicitudin vel arcu convallis."
        subtitle1.font = Font.custom(size: 14, fontWeight: .SemiBold)
        subtitle1.textColor = .white
        subtitle1.numberOfLines = 3
        getView.addSubview(subtitle1)
        subtitle1.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(80)
            make.right.equalToSuperview().inset(20)
        }
        
        iconPointImage2.image = UIImage(named: "icon_point")
        getView.addSubview(iconPointImage2)
        iconPointImage2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(60)
        }
        
        title2.text = "Lorem ipsum dolor sit amet."
        title2.font = Font.custom(size: 18, fontWeight: .Bold)
        title2.textColor = .white
        getView.addSubview(title2)
        title2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.leading.equalToSuperview().offset(80)
            
        }
        
        subtitle2.text = "Lorem ipsum dolor sit amet consectetur. Nec sollicitudin vel arcu convallis."
        subtitle2.font = Font.custom(size: 14, fontWeight: .SemiBold)
        subtitle2.textColor = .white
        subtitle2.numberOfLines = 3
        getView.addSubview(subtitle2)
        subtitle2.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(150)
            make.leading.equalToSuperview().offset(80)
            make.right.equalToSuperview().inset(20)
        }
        
        tryButton.setTitle("Try It Now", for: .normal)
        tryButton.backgroundColor = .customGreen
        tryButton.layer.cornerRadius = 20
        tryButton.addTarget(self, action: #selector(tryButtonTapped), for: .touchUpInside)
        view.addSubview(tryButton)
        tryButton.snp.makeConstraints { make in
            make.top.equalTo(getView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(60)
        }
        
    }
    
    @objc func closeButtonTapped(){
        present(destinationVC: HomeVC(), slideDirection: .left)
    }
    
    
    @objc func tryButtonTapped(){
        present(destinationVC: PaywallVC(), slideDirection: .right)
    }
    
    
}


