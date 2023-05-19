//
//  FeedViewController.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(showPage), for: .touchUpInside)
        
        return button
    }()
    
    let postName: Post = .init(title: "Пост1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        view.addSubview(postButton)
        setConstraints()
        
    }
    
    @objc func showPage () {
        let postViewController = PostViewController()
        postViewController.postName = postName.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}



