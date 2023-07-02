//
//  PhotosViewController.swift
//  Novigation
//
//  Created by Sergey Petrusin on 28.05.2023.
//

import UIKit

class PhotosViewController: UIViewController {
     
    //MARK: - Properties
    

    private let postImages = PostImages.maketPost()
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    
    private lazy var fullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0.0
        
        return imageView
    }()
    
    private let wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.0
        return view
    }()
    
    private lazy var closePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.image =  UIImage(systemName: "xmark.circle")
                imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClosePhoto)))
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray2
        collectionView.dataSource = self

        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
        return collectionView
    }()
    
    //MARK: - LifeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false

        addSubviews()
        setupContraints()
        
        title = "Photo Gallery"
    }
    
    //MARK: - Functions
        
    private func addSubviews(){
        view.addSubview(collectionView)
        view.addSubview(wrapView)
        view.addSubview(fullImageView)
        view.addSubview(closePhoto)
    }
    
    //MARK: - Constraints

    private func setupContraints() {
        
        
        leadingImageView = fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        
        topImageView = fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
constant: 16)
        widthImageView = fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
constant: 16)
        heightImageView = fullImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            wrapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wrapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wrapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            closePhoto.widthAnchor.constraint(equalToConstant: 40),
            closePhoto.heightAnchor.constraint(equalToConstant: 40),
            closePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closePhoto.trailingAnchor.constraint(equalTo: fullImageView.trailingAnchor, constant: -20),
        ])
    }
    
    
    @objc private func tapClosePhoto() {
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                self.fullImageView.layer.opacity = 0.0
                self.closePhoto.layer.opacity = 0.0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                self.wrapView.layer.opacity = 0.0
            }
        }
    }
    
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: postImages[indexPath.row])
        
        
        
        cell.showFullPhoto  = {
            UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {

                self.fullImageView.layer.opacity = 1
                    self.closePhoto.layer.opacity = 1

                    self.fullImageView.image = UIImage(named:self.postImages[indexPath.row].image)
                    self.widthImageView.constant = UIScreen.main.bounds.width - 60
                    self.leadingImageView.constant = 30
                    self.trailingImageView.constant = 30
                    self.topImageView.constant = 30
                }
                    UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                        self.wrapView.layer.opacity = 0.7
                    }
            }
        }
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}
