//
//  PostTableViewCell.swift
//  Novigation
//
//  Created by Sergey Petrusin on 27.05.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        authorText.text = nil
        descriptionText.text = nil
        likes.text = nil
        views.text = nil
    }
    
    func setupCell(model: Post) {
        postImageView.image = UIImage(named: model.image)
        authorText.text = model.author
        descriptionText.text = model.description
        likes.text = "Likes: " + String( model.likes)
        views.text = "Views: " + String(model.views)
    }
        
        private func layout() {
            [wrapView, authorText,postImageView, descriptionText, likes, views].forEach { contentView.addSubview($0)
            }
            let imageInset: CGFloat = 15
            let textInset: CGFloat = 20
            
            NSLayoutConstraint.activate([
                
                
                // contentWhiteView
                wrapView.topAnchor.constraint(equalTo: contentView.topAnchor),
                wrapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                wrapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                wrapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                authorText.topAnchor.constraint(equalTo: wrapView.topAnchor, constant: 15),
                authorText.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor, constant: textInset),
                authorText.trailingAnchor.constraint(equalTo: wrapView.trailingAnchor, constant: 200),
                authorText.heightAnchor.constraint(equalToConstant: 30),
                
                postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: imageInset),
                postImageView.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor),
                postImageView.trailingAnchor.constraint(equalTo: wrapView.trailingAnchor),
                postImageView.heightAnchor.constraint(equalToConstant: 200),
                
                descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
                descriptionText.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor, constant: textInset),
                descriptionText.trailingAnchor.constraint(equalTo: wrapView.trailingAnchor),
                descriptionText.heightAnchor.constraint(equalToConstant: 50),
                
                likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
                likes.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor, constant: textInset),
                likes.heightAnchor.constraint(equalToConstant: 50),
                likes.bottomAnchor.constraint(equalTo: wrapView.bottomAnchor),
                
                views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
                views.trailingAnchor.constraint(equalTo: wrapView.trailingAnchor, constant: -textInset),
                views.heightAnchor.constraint(equalToConstant: 50),
                views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
            ])
        }
    }

