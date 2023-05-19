//
//  InfoViewController.swift
//  Novigation
//
//  Created by Sergey Petrusin on 18.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(runAlert), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            alertButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    @objc func runAlert() {
            let alert = UIAlertController(title: "заголовок", message: "сообщение", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
                print("Ок")
            }
            let okCancel = UIAlertAction(title: "Cancel", style: .default) {_ in
                print("Cancel")
            }
            alert.addAction(okAction)
            alert.addAction(okCancel)
            present(alert, animated: true)  // вывод алерта
        }
    
    
    @objc func returnScreen() {
        dismiss(animated: true)
    }
}
