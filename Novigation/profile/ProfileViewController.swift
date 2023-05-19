//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    let profileHeaderView = ProfileHeaderView()

    
    private let profileHeaderView = {
        let  view =  ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let openPost: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Profile"
        
        view.addSubview(openPost)
        view.addSubview(profileHeaderView)
        view.addSubview(openPost)
        view.addSubview(profileHeaderView)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            openPost.heightAnchor.constraint(
                equalToConstant: 50),
            openPost.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0),
            openPost.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0),
            openPost.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: 0),
        ])
        profileHeaderView.frame = view.frame
    }
    
}
