//
//  OnboardingVC.swift
//  ChatGptAppt
//
//  Created by Mustafa Kemal ARDA on 15.04.2024.
//

import UIKit
import NeonSDK

class OnboardingVC: NeonOnboardingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
    }

    func createUI(){
        self.configureButton(
            title: "Next",
            titleColor: .white,
            font: Font.custom(size: 18, fontWeight: .Bold),
            cornerRadious: 15,
            height: 70,
            horizontalPadding: 40,
            bottomPadding: 0,
            backgroundColor: .customGreen,
            borderColor: nil,
            borderWidth: nil
        )
        self.configureBackground(
            type: .halfBackgroundImage(
                backgroundColor: .black,
                offset: 130,
                isFaded: true)
        )
        self.configurePageControl(
            type: .V1,
            currentPageTintColor: .customGreen,
            tintColor: .lightGray,
            radius: 4,
            padding: 8
        )
        
        self.configureText(
            titleColor: .white,
            titleFont: Font.custom(size: 27, fontWeight: .Bold),
            subtitleColor: .white,
            subtitleFont: Font.custom(size: 18, fontWeight: .Medium)
        )
        
        self.addPage(
            title: "Lorem Ipsum dolor sit",
            subtitle: "Ask the bot anything, It’s always ready to help!",
            image: UIImage(named: "Group 1171274876")!
        )
        
        self.addPage(
            title: "Lorem Ipsum dolor sit",
            subtitle: "Get the best answers from our application Enjoy!",
            image: UIImage(named: "Group 1171274877")!
        )
    }
    
    override func onboardingCompleted() {
        present(destinationVC: HomeVC(), slideDirection: .right)
    }
    
}
