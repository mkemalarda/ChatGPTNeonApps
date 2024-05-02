//
//  HomeVC.swift
//  ChatGPTNeonApp
//
//  Created by Mustafa Kemal ARDA on 17.04.2024.
//

import UIKit
import NeonSDK
import FirebaseFirestore

class HomeVC: UIViewController, UITextFieldDelegate {
    
    let apiKey =  "your api key"
    var prompt = ""
    
    var apps : [AppModel] = []
    var chatCollectionView: NeonCollectionView<AppModel, TextCollectionViewCell>?
    
    var appModelExam = [
        AppModel(textLabelModel: "Hello! How can i help you?", sender: false)]
    
    let refreshButton = UIButton()
    let titleLabel = UILabel()
    let settingsButton = UIButton()
    let enterTextField = UITextField()
    let sendButton = UIButton()
    let upDivider = UIView()
    let downDivider = UIView()
    let copiedView = UIView()
    let copiedLabel = UILabel()
    let apiOutLabel = UILabel()
    
    let database = Firestore.firestore()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        collectionUI()
        dataFirebase()
        
        enterTextField.delegate = self
        
        view.backgroundColor = .black
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.present(destinationVC: PaywallVC(), slideDirection: .right)
        }
    }
    
    // MARK: - Func
    
    func collectionUI(){
        
        let incomeChatCategory = appModelExam
        
        let chatApp = NeonCollectionView<AppModel, TextCollectionViewCell>(
            objects: incomeChatCategory,
            itemsPerRow: 1,
            leftPadding: 20,
            rightPadding: 20,
            horizontalItemSpacing: 30,
            verticalItemSpacing: 10,
            heightForItem: 80
        )
        chatApp.backgroundColor = .black
        view.addSubview(chatApp)
        chatApp.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(45)
        }
        chatCollectionView = chatApp
    }
    
    func dataFirebase(){
        let collectionRef = database.collection("messages")
        collectionRef.getDocuments { [weak self] (snapshot, error) in
            guard let self = self, let snapshot = snapshot else {
                if let error = error {
                    print("Error fetching documents: \(error)")
                }
                return
            }
            for document in snapshot.documents {
                let data = document.data()
                if let userMessage = data["userMessage"] as? String,
                   let botMessage = data["botMessage"] as? String {
                    let userMessageModel = AppModel(textLabelModel: userMessage, sender: true)
                    let botMessageModel = AppModel(textLabelModel: botMessage, sender: false)
                    self.appModelExam.append(userMessageModel)
                    self.appModelExam.append(botMessageModel)
                }
            }
            self.chatCollectionView?.objects = self.appModelExam
        }
    }
    
    func createUI(){
        
        view.bringSubviewToFront(enterTextField)
        view.bringSubviewToFront(sendButton)
        
        refreshButton.setImage(UIImage(named: "icon _refresh"), for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        view.addSubview(refreshButton)
        refreshButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalToSuperview().offset(20)
        }
        titleLabel.text = "ChatGPT"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        settingsButton.setImage(UIImage(named: "icon_settings"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.right.equalToSuperview().inset(20)
        }
        
        upDivider.backgroundColor = .customGreen
        view.addSubview(upDivider)
        upDivider.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        downDivider.backgroundColor = .customGreen
        view.addSubview(downDivider)
        downDivider.snp.makeConstraints { make in
            make.top.equalTo(upDivider.snp.bottom).offset(660)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        enterTextField.placeholder = "Say something..."
        enterTextField.textColor = .white
        view.addSubview(enterTextField)
        enterTextField.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(100)
        }
        
        sendButton.setImage(UIImage(named: "icon_send_unselected"), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        view.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        enterTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        copiedView.layer.cornerRadius = 25
        copiedView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        view.addSubview(copiedView)
        copiedView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(178)
            make.height.equalTo(90)
            
        }
        copiedLabel.text = "Copied!"
        copiedLabel.font = Font.custom(size: 22, fontWeight: .SemiBold)
        copiedLabel.textColor = .white
        copiedView.addSubview(copiedLabel)
        copiedLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        apiOutLabel.textColor = .systemBlue
        view.addSubview(apiOutLabel)
        apiOutLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func refreshButtonTapped(){
        appModelExam.removeAll()
        chatCollectionView?.objects.removeAll()
        chatCollectionView?.reloadData()
        let firstMessage = AppModel(textLabelModel: "Hello! How can i help you?", sender: false)
        appModelExam = [firstMessage]
        chatCollectionView?.objects = appModelExam
        deleteData()
    }
    
    func deleteData() {
        let collectionRef = database.collection("messages")
        collectionRef.getDocuments { [weak self] (snapshot, error) in
            guard let self = self, let snapshot = snapshot else {
                if let error = error {
                    print("Error fetching documents: \(error)")
                }
                return
            }
            
            for document in snapshot.documents {
                let docID = document.documentID
                self.database.collection("messages").document(docID).delete { error in
                    if let error = error {
                        print("Error removing document: \(error)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            }
        }
    }
    
    @objc func settingsTapped(){
        
        present(destinationVC: SettingsVC(), slideDirection: .right)
    }
    
    @objc func sendButtonTapped() {
        if appModelExam.count >= 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                self?.nextGetPremiumPage()
            }
        } else {
            guard let text = enterTextField.text, !text.isEmpty else {
                return
            }
            saveData(userMessage: text, botMessage: text)
            
            let userMessage = AppModel(textLabelModel: text, sender: true)
            appModelExam.append(userMessage)
            
            Services.sendRequest(content: text) { [weak self] responseMessage in
                guard let self = self, let responseMessage = responseMessage else { return }
                
                self.saveData(userMessage: text, botMessage: responseMessage)
                
                let response = AppModel(textLabelModel: responseMessage, sender: false)
                self.appModelExam.append(response)
                
                DispatchQueue.main.async {
                    self.chatCollectionView?.objects = self.appModelExam
                }
            }
            enterTextField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            saveData(userMessage: text, botMessage: text)
        }
        return true
    }
    func saveData(userMessage: String, botMessage: String) {
        let docRef = database.collection("messages").document()
        docRef.setData([
            "userMessage": userMessage,
            "botMessage": botMessage
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Data added successfully!")
            }
        }
    }
    @objc func textFieldDidChange() {
        
        if let text = enterTextField.text , !text.isEmpty {
            
            sendButton.setImage(UIImage(named: "icon_send_selected"), for: .normal)
            
        } else {
            sendButton.setImage(UIImage(named: "icon_send_unselected"), for: .normal)
        }
    }
    func nextGetPremiumPage() {
        let nextVC = GetPremiumVC()
        present(destinationVC: nextVC, slideDirection: .right)
    }
}
