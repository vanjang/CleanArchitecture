//
//  HomeView.swift
//  CleanArchitecture
//
//  Created by myung hoon on 21/04/2024.
//

import UIKit

final class HomeView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.accessibilityIdentifier = "HomeViewImageViewID"
        return imageView
    }()

    let proceedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Collection", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "HomeViewProceedButtonID"
        return button
    }()

    let aboutRijkMuseumButton: UIButton = {
        let button = UIButton()
        button.setTitle("About Rijks Museum", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "HomeViewAboutButtonID"
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(imageView)
        addSubview(proceedButton)
        addSubview(aboutRijkMuseumButton)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        proceedButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        proceedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150).isActive = true
        
        aboutRijkMuseumButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aboutRijkMuseumButton.topAnchor.constraint(equalTo: proceedButton.bottomAnchor, constant: 6).isActive = true
    }
    
    func configure(imageString: String) {
        imageView.image = UIImage(named: imageString)
    }
}
