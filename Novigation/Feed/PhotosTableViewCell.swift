//
//  PhotosTableViewCell.swift
//  Novigation
//
//  Created by Sergey Petrusin on 30.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    private let headerLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let imageView1: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 60
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 60
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 60
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView4: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 60
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    //MARK: - Functions
        
    private func addSubviews(){
        
        contentView.addSubview(mainView)
        contentView.addSubview(imageView1)
        contentView.addSubview(imageView2)
        contentView.addSubview(imageView3)
        contentView.addSubview(imageView4)
        contentView.addSubview(headerLabel)
        contentView.addSubview(imageRight)
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {

        let imageSize: CGFloat = contentView.frame.width / 4
            
        NSLayoutConstraint.activate([
            
            //             mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            //            headerLabel
            headerLabel.topAnchor.constraint(equalTo: mainView.topAnchor ,constant: Metric.labelInset),
            headerLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: Metric.labelInset),
            
            //            imageView1
            imageView1.widthAnchor.constraint(equalToConstant: imageSize),
            imageView1.heightAnchor.constraint(equalToConstant: imageSize),
            imageView1.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: Metric.imageInset),
            imageView1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView2
            imageView2.widthAnchor.constraint(equalToConstant: imageSize),
            imageView2.heightAnchor.constraint(equalToConstant: imageSize),
            imageView2.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor,constant: Metric.imageLeftInset),
            imageView2.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView3
            imageView3.widthAnchor.constraint(equalToConstant: imageSize),
            imageView3.heightAnchor.constraint(equalToConstant: imageSize),
            imageView3.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor,constant: Metric.imageLeftInset),
            imageView3.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -Metric.imageInset),
            
            //            imageView4
            imageView4.widthAnchor.constraint(equalToConstant: imageSize),
            imageView4.heightAnchor.constraint(equalToConstant: imageSize),
            imageView4.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: Metric.imageInset),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor,constant: Metric.imageLeftInset),
            imageView4.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -Metric.imageInset),
            
            //            ImageArrow
            imageRight.widthAnchor.constraint(equalToConstant: Metric.imageRightInset),
//            imageArrow.heightAnchor.constraint(equalToConstant: Metric.imageArrowInset),
            imageRight.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),
            imageRight.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor)
        ])
    }
    
    //MARK: - Action
    
    let photosViewController =  {
        PhotosViewController()
    }()
}

extension PhotosTableViewCell {
    func createImageView(nameImageView: String, nameImage: String) -> UIImageView{
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 3
            imageView.layer.cornerRadius = 6
            imageView.image = UIImage(named: nameImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        return nameImageView
    }
}

extension PhotosTableViewCell {
    enum Metric {
        static let labelInset: CGFloat = 12
        static let imageInset: CGFloat = 12
        static let imageLeftInset: CGFloat = 8
        static let imageRightInset: CGFloat = 30
    }
}
