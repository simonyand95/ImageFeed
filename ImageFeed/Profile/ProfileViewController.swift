//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Диана Симонян on 18.05.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private var label1: UILabel?
    private var label2: UILabel?
    private var label3: UILabel?
    private var imageProfileView: UIImageView?
    
    @objc private func didTapExitButton() {
        for view1 in view.subviews {
            if view1 is UILabel {
                view1.removeFromSuperview()
            }
            if view1 is UIImageView {
                
                view1.removeFromSuperview()
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
            if view1 is UIButton {
                view1.removeFromSuperview()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        label1.text = "Екатерина Новикова"
        label1.textColor = .white
        label1.font = UIFont.boldSystemFont(ofSize: 23)
        
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        label2.text = "@ekaterine_nov"
        label2.textColor = .gray
        label2.font = UIFont.systemFont(ofSize: 13)
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label3)
        label3.text = "Hello, world!"
        label3.textColor = .white
        label3.font = UIFont.systemFont(ofSize: 13)
        
        
        let profileImage = UIImage(named: "Photo")
        let imageProfileView = UIImageView(image: profileImage)
        imageProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageProfileView)
        
        
        
        let exitButton = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
            target: self,
            action: #selector(self.didTapExitButton)
        )
        
        //let imageExitView = UIImageView(image: exitImage)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        exitButton.tintColor = .red
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: imageProfileView.bottomAnchor, constant: 10),
            label1.leadingAnchor.constraint(equalTo: imageProfileView.leadingAnchor, constant: 0),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.leadingAnchor.constraint(equalTo: label1.leadingAnchor, constant: 0),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            label3.leadingAnchor.constraint(equalTo: label2.leadingAnchor, constant: 0),
            
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
