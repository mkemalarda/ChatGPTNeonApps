//
//  PaywallVC.swift
//  ChatGptAppt
//
//  Created by Mustafa Kemal ARDA on 15.04.2024.
//

import UIKit
import NeonSDK


class PaywallVC: UIViewController {
    
    let closeButton = UIButton()
    let chatLabel = UILabel()
    let subtitleLabel = UILabel()
    let unlockLabel = UITextField()
    let lockImage = UIImageView()
    let nextButton = UIButton()
    let animationView = UIView()
    let weeklyButton = CustomPaywallVC(title: "Weekly", subtitle: "US$3.99/week")
    let monthlyButton = CustomPaywallVC(title: "Monthly", subtitle: "US$19.99/month")
    let annualButton = CustomPaywallVC(title: "Annual", subtitle: "US$39.99/annual")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        createUI()
    }
    
    func createUI(){
        
        closeButton.setImage(UIImage(named: "icon_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.right.equalToSuperview().inset(20)
        }
        
        chatLabel.text = "ChatGPT"
        chatLabel.textColor = .white
        chatLabel.font = Font.custom(size: 36, fontWeight: .Bold)
        view.addSubview(chatLabel)
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        subtitleLabel.text = "Unlimited chat with gpt for only, Try It Now."
        subtitleLabel.textColor = .white
        subtitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(chatLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
        
        unlockLabel.text = "Unlock to continue"
        unlockLabel.textColor = .white
        unlockLabel.font = Font.custom(size: 19, fontWeight: .Bold)
        view.addSubview(unlockLabel)
        unlockLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        lockImage.image = UIImage(named: "icon_lock")
        view.addSubview(lockImage)
        lockImage.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(60)
        }
        
        view.addSubview(weeklyButton)
        weeklyButton.addTarget(self, action: #selector(weeklyTapped), for: .touchUpInside)
        weeklyButton.snp.makeConstraints { make in
            make.top.equalTo(unlockLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(100)
        }
        
        view.addSubview(monthlyButton)
        monthlyButton.addTarget(self, action: #selector(monthlyTapped), for: .touchUpInside)
        monthlyButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(100)
        }
        
        view.addSubview(annualButton)
        annualButton.addTarget(self, action: #selector(annualTapped), for: .touchUpInside)
        
        annualButton.snp.makeConstraints { make in
            make.top.equalTo(monthlyButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(100)
        }
        
        let legalView = NeonLegalView()
        legalView.configureLegalController(onVC: self, backgroundColor: .black, headerColor: .customGreen, titleColor: .white, textColor: .white)
        legalView.restoreButtonClicked = {
            
        }
        legalView.textColor = .gray
        view.addSubview(legalView)
        legalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        nextButton.setTitle("Try It Now", for: .normal)
        nextButton.addTarget(self, action: #selector(tryTapped), for: .touchUpInside)
        nextButton.backgroundColor = .customGreen
        nextButton.layer.cornerRadius = 20
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(annualButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(60)
        }
        
    }
    
    @objc func closeTapped(){
        self.dismiss(animated: true)
    }
    
    @objc func weeklyTapped(){
        weeklyButton.isSelectedButton = true
        monthlyButton.isSelectedButton = false
        annualButton.isSelectedButton = false
    }
    
    @objc func monthlyTapped(){
        weeklyButton.isSelectedButton = false
        monthlyButton.isSelectedButton = true
        annualButton.isSelectedButton = false
    }
    
    @objc func annualTapped(){
        weeklyButton.isSelectedButton = false
        monthlyButton.isSelectedButton = false
        annualButton.isSelectedButton = true
    }
    
    @objc func tryTapped() {
        animationView.backgroundColor = .white
        view.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(120)
        }
        
        LottieManager.showFullScreenLottie(animation: .loadingCircle3, color: .customGreen, backgroundOpacity: 0)
        LottieManager.showFullScreenLottie(animation: .loadingLines, color: .clear)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.dismiss(animated: true)
            LottieManager.removeFullScreenLottie()
            
        }
    }
}

