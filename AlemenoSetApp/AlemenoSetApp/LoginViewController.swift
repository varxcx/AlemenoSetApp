//
//  ViewController.swift
//  AlemenoSetApp
//
//  Created by Vardhan Chopada on 10/7/23.
//

import UIKit

class LoginViewController: UIViewController {
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let registerButton = UIButton()
    private let passwordVisibilityButton = UIButton(type: .custom)
    static var users: [(username: String, password: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view and add UI elements
        view.backgroundColor = .white
        
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.font = UIFont.systemFont(ofSize: 34)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.layer.shadowColor = UIColor.gray.cgColor
        loginLabel.layer.shadowOffset = CGSize(width: 8.0, height: 4.0)
        loginLabel.layer.shadowRadius = 5.0
        loginLabel.layer.shadowOpacity = 0.8
        
        
        view.addSubview(loginLabel)
        
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        
        
        passwordVisibilityButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        passwordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordVisibilityButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(passwordVisibilityButton)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.black
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 6.0, height: 3.0)
        loginButton.layer.shadowRadius = 5.0
        loginButton.layer.shadowOpacity = 0.8
        
        view.addSubview(loginButton)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = UIColor.black
        registerButton.layer.cornerRadius = 10
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.layer.shadowColor = UIColor.gray.cgColor // Shadow color
        registerButton.layer.shadowOffset = CGSize(width: 6.0, height: 3.0) // Shadow offset
        registerButton.layer.shadowRadius = 5.0 // Shadow radius
        registerButton.layer.shadowOpacity = 0.8 // Shadow opacity
        
        view.addSubview(registerButton)
        
        // Create constraints
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 60),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordVisibilityButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordVisibilityButton.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 10),
            passwordVisibilityButton.widthAnchor.constraint(equalToConstant: 30),
            passwordVisibilityButton.heightAnchor.constraint(equalToConstant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        let user1: (username: String, password: String) = (username: "alemenoDefault", password: "password123")
        LoginViewController.users.append(user1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

        usernameTextField.text = ""
        passwordTextField.text = ""
       }
    
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        
        // Toggle the eye icon based on the current state
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        passwordVisibilityButton.setImage(UIImage(systemName: imageName)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        print("Login")
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        
        guard let enteredUsername = usernameTextField.text,
              let enteredPassword = passwordTextField.text else {
            showErrorAlert(message: "Please Enter Username and Password")
            return
        }
        
        if let user = LoginViewController.users.first(where: { $0.username == enteredUsername && $0.password == enteredPassword }) {
            // Successful login
            let destinationVC = LoggedViewController()
            destinationVC.modalPresentationStyle = .fullScreen
            self.present(destinationVC, animated: true, completion: nil)
            print("Login successful for user: \(user.username)")
        } else {
            // Invalid login, display an error message or take appropriate action
            showErrorAlert(message: "Invalid username or password.")
        }
        
    }
    
    @objc func registerButtonTapped(_ sender: UIButton) {
        print("Register")
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        let destinationVC = RegisterViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}


