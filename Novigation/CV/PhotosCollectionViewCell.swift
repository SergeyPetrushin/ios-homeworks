//
//  PhotosCollectionViewCell.swift
//  Novigation
//
//  Created by Sergey Petrusin on 30.05.2023.
//


import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    var showFullPhoto: (() -> Void)? = nil

    //MARK: - Property

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFullPhoto)))

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
        imageView.image = UIImage(named: model.image)
    }

    private func addSubviews(){
        contentView.addSubview(imageView)
    }
    
    //MARK: - Constraints
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc func tapFullPhoto() {
        if let action = self.showFullPhoto { action() }
    }
    
}
