//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    //MARK: - Properties

    private let postFeed = Post.createPost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

    }
    //MARK: - Functions
        
    private func addSubviews(){
        view.addSubview(tableView)
    }
    //MARK: - Constraints

    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: postFeed[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
}
extension ProfileViewController: UITableViewDelegate {
}
    
    
    
    
//    let profileHeaderView = ProfileHeaderView()

//
//    private let profileHeaderView = {
//        let  view =  ProfileHeaderView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
//    private let openPost: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Post", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .red
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
        
        
//        view.backgroundColor = .lightGray
//        title = "Profile"
//
//        view.addSubview(openPost)
//        view.addSubview(profileHeaderView)
//        view.addSubview(openPost)
//        view.addSubview(profileHeaderView)
//        setupLayoutConstraint()
//
//         func setupLayoutConstraint () {
//            NSLayoutConstraint.activate([
//                profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                openPost.heightAnchor.constraint(
//                    equalToConstant: 50),
//                openPost.leadingAnchor.constraint(
//                    equalTo: view.leadingAnchor,
//                    constant: 0),
//                openPost.trailingAnchor.constraint(
//                    equalTo: view.trailingAnchor,
//                    constant: 0),
//                openPost.bottomAnchor.constraint(
//                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
//                    constant: 0),
//            ])
//        }
        
        
        
//    }
//}
