//
//  LoggedViewController.swift
//  AlemenoSetApp
//
//  Created by Vardhan Chopada on 10/7/23.
//

import UIKit

class LoggedViewController: UIViewController {
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let logoutLabel = UILabel()
        logoutLabel.text = "Hey there, you're are Logged In"
        logoutLabel.font = UIFont.systemFont(ofSize: 26)
        logoutLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutLabel.layer.shadowColor = UIColor.gray.cgColor
        logoutLabel.layer.shadowOffset = CGSize(width: 8.0, height: 4.0)
        logoutLabel.layer.shadowRadius = 5.0
        logoutLabel.layer.shadowOpacity = 0.8
        
        view.addSubview(logoutLabel)
        
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = UIColor.black
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.layer.shadowColor = UIColor.gray.cgColor
        logoutButton.layer.shadowOffset = CGSize(width: 6.0, height: 3.0)
        logoutButton.layer.shadowRadius = 5.0
        logoutButton.layer.shadowOpacity = 0.8
        
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: logoutLabel.bottomAnchor, constant: 80),
            logoutButton.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        print("Logout")
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        
        showAlert()
    }
    
    func showAlert() {
            let alertController = UIAlertController(title: "Logout", message: "Do you want to Logout?", preferredStyle: .alert)

            // Create the "Yes" action
            let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] (_) in
                // Dismiss the current view controller
                self?.dismiss(animated: true, completion: nil)
            }

            // Create the "No" action
            let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)

            // Add the actions to the alert controller
            alertController.addAction(yesAction)
            alertController.addAction(noAction)

            // Present the alert controller
            present(alertController, animated: true, completion: nil)
        }

}
