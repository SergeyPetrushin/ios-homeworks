//
//  PhotosCollectionViewCell.swift
//  Novigation
//
//  Created by Sergey Petrusin on 30.05.2023.
//


import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property

    private let ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 60
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    //MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions

    private func setCell() {
    }
    
    func setupCell(model: PostImages) {
        ImageView.image = UIImage(named: model.image)
    }

    private func addSubviews(){
        contentView.addSubview(ImageView)
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
