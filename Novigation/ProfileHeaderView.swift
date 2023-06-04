//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightWrapView = NSLayoutConstraint()
    
    private let avatarLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let layerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    private lazy var closeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClose)))
        return imageView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "solnce-svet.orig")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOpen)))
        return imageView
    }()
    
    private let titleName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var  button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = "status..."
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
        addSubview(avatarLayer)
        addSubview(layerView)
        addSubview(imageView)
        addSubview(closeImage)
    }
    private  func setupLayoutConstraint() {
        
        leadingImageView = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = imageView.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = imageView.widthAnchor.constraint(equalToConstant: 95)
        heightImageView = imageView.heightAnchor.constraint(equalToConstant: 95)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        heightWrapView = layerView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightWrapView])
        
        NSLayoutConstraint.activate([
            
            layerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            layerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            layerView.topAnchor.constraint(equalTo: topAnchor),
            
            closeImage.widthAnchor.constraint(equalToConstant: 30),
            closeImage.heightAnchor.constraint(equalToConstant: 30),
            closeImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            avatarLayer.widthAnchor.constraint(equalToConstant: 95),
            avatarLayer.heightAnchor.constraint(equalToConstant: 95),
            avatarLayer.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarLayer.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            titleName.leadingAnchor.constraint(equalTo: avatarLayer.trailingAnchor,constant: 20),
            titleName.widthAnchor.constraint(equalToConstant: 100),
            titleName.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            titleName.topAnchor.constraint(equalTo: avatarLayer.topAnchor ,constant: 0),
            titleName.widthAnchor.constraint(equalToConstant: 100),
            titleName.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            titleStatus.trailingAnchor.constraint(equalTo: titleName.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 10),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    @objc func buttonPressed() {
        
        if let text =  textField.text {
            titleStatus.text = text
            if titleStatus.text == "" {
                titleStatus.text = " "
            }
            print(text)}
    }
    
    @objc private func tapOpen() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                self.widthImageView.constant = UIScreen.main.bounds.width - 60
                self.leadingImageView.constant = 30
                self.trailingImageView.constant = 30
                self.topImageView.constant = 30
                self.heightImageView.constant = UIScreen.main.bounds.height - 220
                self.heightWrapView.constant =  UIScreen.main.bounds.height
                self.imageView.layer.cornerRadius = 0
                self.layerView.isHidden = false
                self.closeImage.layer.opacity = 1
                self.layerView.layer.opacity = 0.3
            }
        }
    }
    
    @objc private func tapClose() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeImage.layer.opacity = 0
                self.layerView.layer.opacity = 0
                self.layerView.isHidden = false
                self.layerView.isHidden = true
                self.imageView.layer.cornerRadius = 50
                self.widthImageView.constant = 95
                self.leadingImageView.constant = 16
                self.trailingImageView.constant = 30
                self.topImageView.constant = 16
                self.heightImageView.constant = 95
                self.heightWrapView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}
