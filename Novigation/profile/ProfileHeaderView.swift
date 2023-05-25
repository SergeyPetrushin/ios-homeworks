//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    

    
    
    private var statusText: String = ""

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "solnce-svet.orig")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(imageView)
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
    }
//
//
//
//
        
            private  func setupLayoutConstraint() {
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                imageView.widthAnchor.constraint(equalToConstant: 120),
                imageView.heightAnchor.constraint(equalToConstant: 120),
                
                titleName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
                titleName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                titleName.widthAnchor.constraint(equalToConstant: 100),
                
                titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
                titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
                titleStatus.widthAnchor.constraint(equalToConstant: 150),
                
                button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 50),
                button.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 10),
                textField.heightAnchor.constraint(equalToConstant: 40),
                textField.widthAnchor.constraint(equalToConstant: 200),
                textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
        }
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        titleName.translatesAutoresizingMaskIntoConstraints = false
//        titleStatus.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        textField.translatesAutoresizingMaskIntoConstraints = false


    
    
    @objc func buttonPressed() {
       
        if let text =  textField.text {
            titleStatus.text = text
            if titleStatus.text == "" {
                titleStatus.text = " "
            }
            print(text)}
    }
}
