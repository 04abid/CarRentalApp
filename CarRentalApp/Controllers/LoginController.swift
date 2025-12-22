//
//  LoginController.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        nameTextField.layer.cornerRadius = nameTextField.frame.height / 2
        nameTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        passwordTextField.clipsToBounds = true
        logInButton.layer.cornerRadius = logInButton.frame.height / 2
        logInButton.clipsToBounds = true
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MainTabBarController.self)") as! MainTabBarController
        if let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let scenedelegate = windowsScene.delegate as? SceneDelegate
            scenedelegate?.window?.rootViewController = UINavigationController(rootViewController: controller)
            scenedelegate?.window?.makeKeyAndVisible()
        }
    }
    
}
