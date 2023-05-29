//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Диана Симонян on 18.05.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private var imageProfileView: UIImageView?
    
    @objc private func didTapExitButton() {
        for member in view.subviews {
            if member is UILabel {
                member.removeFromSuperview()
            }
            if member is UIImageView {
                
                member.removeFromSuperview()
                let profileImage = UIImage(systemName: "person.crop.circle.fill")
                let imageProfileView = UIImageView(image: profileImage)
                imageProfileView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(imageProfileView)
                imageProfileView.tintColor = .gray
                
                
                NSLayoutConstraint.activate([
                    
                    imageProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    imageProfileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                    imageProfileView.heightAnchor.constraint(equalToConstant: 70),
                    imageProfileView.widthAnchor.constraint(equalToConstant: 70)
                    
                ])
                
                
            }
            if member is UIButton {
                member.removeFromSuperview()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelName)
        labelName.text = "Екатерина Новикова"
        labelName.textColor = .white
        labelName.font = UIFont.boldSystemFont(ofSize: 23)
        
        
        let labelNick = UILabel()
        labelNick.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelNick)
        labelNick.text = "@ekaterine_nov"
        labelNick.textColor = .gray
        labelNick.font = UIFont.systemFont(ofSize: 13)
        
        let labelComment = UILabel()
        labelComment.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelComment)
        labelComment.text = "Hello, world!"
        labelComment.textColor = .white
        labelComment.font = UIFont.systemFont(ofSize: 13)
        
        
        let profileImage = UIImage(named: "Photo")
        let imageProfileView = UIImageView(image: profileImage)
        imageProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageProfileView)
        
        
        
        let exitButton = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
            target: self,
            action: #selector(self.didTapExitButton)
        )
        
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        exitButton.tintColor = .red
        
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: imageProfileView.bottomAnchor, constant: 10),
            labelName.leadingAnchor.constraint(equalTo: imageProfileView.leadingAnchor, constant: 0),
            
            labelNick.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelNick.leadingAnchor.constraint(equalTo: labelName.leadingAnchor, constant: 0),
            
            labelComment.topAnchor.constraint(equalTo: labelNick.bottomAnchor, constant: 10),
            labelComment.leadingAnchor.constraint(equalTo: labelNick.leadingAnchor, constant: 0),
            
            imageProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageProfileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageProfileView.heightAnchor.constraint(equalToConstant: 70),
            imageProfileView.widthAnchor.constraint(equalToConstant: 70),
            
            exitButton.centerYAnchor.constraint(equalTo: imageProfileView.centerYAnchor, constant: 0),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 22),
            exitButton.widthAnchor.constraint(equalToConstant: 20)
            
        ])
        
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
