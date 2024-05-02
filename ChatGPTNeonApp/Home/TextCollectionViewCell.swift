//
//  CollectionViewCell.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 20.04.2024.
//

import UIKit
import NeonSDK

class TextCollectionViewCell: NeonCollectionViewCell<AppModel>{
    private let incomeLabel = UILabel()
    private let robotImage = UIImageView()
    private let copyButton = UIButton()
    private let incomeMessageView = UIView()
    
    private let sendLabel = UILabel()
    private let sendMessageView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        incomeSetup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configure(with app: AppModel) {
        super.configure(with: app)
        
        incomeLabel.text = app.textLabelModel
        DispatchQueue.main.async { [self] in
            if app.sender == false {
                incomeMessageView.isHidden = false
                sendMessageView.isHidden = true
                sendLabel.isHidden = true
                copyButton.isHidden = false
                incomeMessageView.backgroundColor = .customGray
                incomeLabel.text = app.textLabelModel
                
            } else if app.sender == true {
                sendMessageView.backgroundColor = .customGreen
                incomeMessageView.isHidden = true
                sendMessageView.isHidden = false
                sendLabel.isHidden = false
                robotImage.isHidden = true
                copyButton.isHidden = true
                sendLabel.text = app.textLabelModel
            } else {
                print("dfdsfs")
            }
        }
    }
    
    private func incomeSetup() {
        
        contentView.addSubview(incomeMessageView)
        incomeMessageView.addSubview(incomeLabel)
        incomeMessageView.addSubview(copyButton)
        
        incomeMessageView.backgroundColor = .customGray
        incomeMessageView.layer.cornerRadius = 20
        incomeMessageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(0)
            make.width.equalTo(280)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        copyButton.setImage(UIImage(named: "icon_copy"), for: .normal)
        copyButton.addTarget(self, action: #selector(copyButtonTapped), for: .touchUpInside)
        copyButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.height.width.equalTo(45)
        }
        incomeLabel.textColor = .white
        incomeLabel.numberOfLines = 0
        incomeLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        incomeLabel.sizeToFit()
        
        robotImage.image = UIImage(named: "Ellipse 3")
        contentView.addSubview(robotImage)
        robotImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.leading.equalToSuperview().offset(-20)
            make.height.width.equalTo(20)
        }
        
        sendMessageView.addSubview(sendLabel)
        contentView.addSubview(sendMessageView)
        sendMessageView.layer.cornerRadius = 20
        sendMessageView.backgroundColor = .customGreen
        sendMessageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(0)
            make.width.equalTo(280)
            make.bottom.equalToSuperview().offset(-10)
        }
        sendLabel.textColor = .white
        sendLabel.numberOfLines = 0
        sendLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()        }
        sendLabel.sizeToFit()
    }
    
    @objc func copyButtonTapped(){
        guard let text = incomeLabel.text else { return }
        UIPasteboard.general.string = text
    }
}

